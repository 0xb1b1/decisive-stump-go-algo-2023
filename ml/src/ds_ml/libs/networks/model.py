import torch
import torch.nn as nn


class LSTM(nn.Module):
    def __init__(self, input_dim, hidden_dim, output_dim, vocab_sizes, emb_dim, desc_dim=0):
        super().__init__()
        
        self.vocab_sizes = vocab_sizes
        self.input_dim = input_dim
        self.hidden_dim = hidden_dim
        self.output_dim = output_dim
        self.emb_dim = emb_dim
        self.desc_dim = desc_dim

        if len(self.vocab_sizes) > 0:
            self.cat_embeddings = nn.ModuleList([nn.Embedding(self.vocab_sizes[i], 
                                                              self.emb_dim*2) for i in range(len(self.vocab_sizes))])

        self.batch_norm = nn.BatchNorm1d(self.input_dim)
        self.cont_embeddings = nn.Linear(self.input_dim, self.emb_dim)

        self.categorical_linear = nn.Linear(self.desc_dim, self.emb_dim)
        
        self.lstm = nn.LSTM(self.emb_dim*(2+(len(self.vocab_sizes)*2)), self.hidden_dim, num_layers=1, batch_first=True, bidirectional=False)
        self.linear1 = nn.Linear(self.hidden_dim, self.hidden_dim*2)
        self.linear2 = nn.Linear(self.hidden_dim*2, self.output_dim)
        self.relu = nn.ReLU()

    def forward(self, feature_seq, categorical_seq, description_seq):
        # input_seq = self.bnorm(input_seq.transpose(1,2)).transpose(1,2)
        
        cont_embeddings = self.cont_embeddings(self.batch_norm(feature_seq.transpose(1,2)).transpose(1,2))
        if len(self.vocab_sizes) > 0:
            cat_embeddings = torch.cat([self.cat_embeddings[i](categorical_seq[:,:,i].long()) for i in range(len(self.vocab_sizes))], dim=2)
        else:
            cat_embeddings = torch.tensor([]).to(cont_embeddings.device)
            
        description_seq = self.categorical_linear(description_seq)
        cat_embeddings = torch.cat([cat_embeddings, description_seq], dim=2).repeat(1, feature_seq.shape[1], 1)
            
        out = torch.cat([cont_embeddings, cat_embeddings], dim=2)
        # out = torch.cat([out, feature_seq], dim=2)
        # out = torch.cat([out, description_seq], dim=2)
        output, (hout, cout) = self.lstm(out)
        out = self.relu(hout[-1])
        out = self.linear1(out)
        out = self.relu(out)
        out = self.linear2(out)
        return out