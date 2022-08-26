import { PrismaClient } from '@prisma/client'
 
const prisma = new PrismaClient()
 
export type GraphQLContext = {
  prisma: PrismaClient
}
 
export function createContext(): GraphQLContext {
  return { prisma }
}