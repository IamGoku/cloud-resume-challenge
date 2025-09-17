import boto3, json, os

TABLE = os.environ.get("TABLE_NAME", "VisitorCount")
dynamodb = boto3.resource("dynamodb")
table = dynamodb.Table(TABLE)

def lambda_handler(event, context):
    try:
        resp = table.update_item(
            Key={"id": "site_visits"},
            UpdateExpression="SET #c = if_not_exists(#c, :start) + :inc",
            ExpressionAttributeNames={"#c": "count"},
            ExpressionAttributeValues={":inc": 1, ":start": 0},
            ReturnValues="UPDATED_NEW",
        )
        return {
            "statusCode": 200,
            "headers": {"Content-Type": "application/json", "Access-Control-Allow-Origin": "*"},
            "body": json.dumps({"visits": int(resp["Attributes"]["count"])})
        }
    except Exception as e:
        return {
            "statusCode": 500,
            "headers": {"Content-Type": "application/json", "Access-Control-Allow-Origin": "*"},
            "body": json.dumps({"error": str(e)})
        }
