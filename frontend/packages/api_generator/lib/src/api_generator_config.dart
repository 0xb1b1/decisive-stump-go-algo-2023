import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

@Openapi(
  additionalProperties: AdditionalProperties(
    pubName: 'app_api',
    pubVersion: '1.0.0',
  ),
  inputSpecFile: 'openapi/api_spec.yaml',
  generatorName: Generator.dio,
  outputDirectory: '../app_api',
  alwaysRun: true,
)
class APIConfig extends OpenapiGeneratorConfig {}