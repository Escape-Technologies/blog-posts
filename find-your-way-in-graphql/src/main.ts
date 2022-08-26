import { createServer } from '@graphql-yoga/node'
import { createContext } from './context'
import { schema } from './schema'
 
async function main() {
  const server = createServer({ schema, context: createContext })
  await server.start()
}
 
main()