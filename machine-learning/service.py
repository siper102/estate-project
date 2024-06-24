import bentoml
from bentoml.io import JSON
from dto.estate_input import EstateInput
from dto.estate_output import EstateOutput

regression_runner = bentoml.sklearn.get("estate-regressor:latest").to_runner()
tree = bentoml.Service("estate_fastapi_demo", runners=[regression_runner])


@tree.api(
    input=JSON(pydantic_model=EstateInput), output=JSON(pydantic_model=EstateOutput)
)
def predict(input_series: EstateInput) -> EstateOutput:
    result = regression_runner.run(input_series.model_dump())
    return result
