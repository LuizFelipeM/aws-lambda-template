import { APIGatewayProxyHandlerV2 } from 'aws-lambda'
import teste from './common/teste'

export const handler: APIGatewayProxyHandlerV2 = async (event) => {
  const valorDeTeste = teste()

  console.log(`valorDeTeste`, valorDeTeste)

  return {
    statusCode: 200,
    body: JSON.stringify(event)
  }
}