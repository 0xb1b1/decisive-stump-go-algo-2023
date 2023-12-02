#!/usr/bin/env python3
from fastapi import APIRouter
from ds_backend.http.models.user import User

# See https://fastapi.tiangolo.com/tutorial/bigger-applications/

router = APIRouter(
    prefix="/user",
    tags=['User',],
    # dependencies=[Depends(get_token_header)],
    responses={404: {"description": "Not found"}}
)


@router.post(
    '/add',
    response_model=User
)
async def register_user(user: User):
    print(user.name)
    return user
