import logging
import os

import azure.functions as func
from weasyprint import HTML


def main(req: func.HttpRequest) -> func.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')
    logging.info('code = ' + req.params.get('code', ''))
    logging.info('FUNCTION_CODE = ' + os.getenv('FUNCTION_CODE', ''))

    if req.params.get('code', '') != os.getenv('FUNCTION_CODE', ''):
        return func.HttpResponse("Invalid code", status_code=404)

    pdf = HTML(string=req.get_body().decode('utf-8')).write_pdf()
    return func.HttpResponse(pdf)
