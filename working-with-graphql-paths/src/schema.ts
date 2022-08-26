import { makeExecutableSchema } from '@graphql-tools/schema';
import { GraphQLContext } from './context';

const typeDefinitions = /* GraphQL */ `
  type User {
    name: String!
    organization: Organization!
  }

  type Organization {
    name: String!
    users: [User!]!
  }

  type Query {
    getUser(name: String!): User
    getOrganization(name: String!): Organization
  }
`

const resolvers = {
  Query: {
    getUser: (_parent: unknown, args: {name: string}, context: GraphQLContext) => {
      return context.prisma.user.findUnique({
        where: {
          name: args.name
        }
      })
    },
    getOrganization: (_parent: unknown, args: {name: string}, context: GraphQLContext) => {
      return context.prisma.organization.findUnique({
        where: {
          name: args.name
        }
      });
    }
  },
  User: {
    organization: (parent: any, _args: unknown, context: GraphQLContext) => {
      return context.prisma.organization.findUnique({
        where: {
          id: parent.organizationId
        }
      })
    }
  },
  Organization: {
    users: (parent: any, _args: unknown, context: GraphQLContext) => {
      return context.prisma.user.findMany({
        where: {
          organization: parent.organizationId
        }
      })
    }
  }
}

export const schema = makeExecutableSchema({
  resolvers: [resolvers],
  typeDefs: [typeDefinitions]
})