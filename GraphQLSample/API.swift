//  This file was automatically generated and should not be edited.

import Apollo

public enum UserType: String {
  case student = "student"
  case teacher = "teacher"
  case parent = "parent"
}

extension UserType: JSONDecodable, JSONEncodable {}

public final class UserLoginMutation: GraphQLMutation {
  public static let operationDefinition =
    "mutation userLogin($civilId: String!, $password: String!) {" +
    "  userLogin(civilId: $civilId, password: $password) {" +
    "    __typename" +
    "    id" +
    "    fullName" +
    "    userCategory" +
    "    token" +
    "  }" +
    "}"

  public let civilId: String
  public let password: String

  public init(civilId: String, password: String) {
    self.civilId = civilId
    self.password = password
  }

  public var variables: GraphQLMap? {
    return ["civilId": civilId, "password": password]
  }

  public struct Data: GraphQLMappable {
    public let userLogin: UserLogin?

    public init(reader: GraphQLResultReader) throws {
      userLogin = try reader.optionalValue(for: Field(responseName: "userLogin", arguments: ["civilId": reader.variables["civilId"], "password": reader.variables["password"]]))
    }

    public struct UserLogin: GraphQLMappable {
      public let __typename: String
      public let id: String?
      public let fullName: String?
      public let userCategory: UserType?
      public let token: String?

      public init(reader: GraphQLResultReader) throws {
        __typename = try reader.value(for: Field(responseName: "__typename"))
        id = try reader.optionalValue(for: Field(responseName: "id"))
        fullName = try reader.optionalValue(for: Field(responseName: "fullName"))
        userCategory = try reader.optionalValue(for: Field(responseName: "userCategory"))
        token = try reader.optionalValue(for: Field(responseName: "token"))
      }
    }
  }
}

public final class UserSignupMutation: GraphQLMutation {
  public static let operationDefinition =
    "mutation userSignup($fullName: String!, $emailId: String!, $mobileNumber: String!, $civilId: String!, $password: String!, $address: String!, $city: String!, $state: String!, $country: String!, $zipCode: String!, $timeStamp: String!, $userCategory: String!) {" +
    "  userSignup(fullName: $fullName, emailId: $emailId, mobileNumber: $mobileNumber, civilId: $civilId, password: $password, address: $address, city: $city, state: $state, country: $country, zipCode: $zipCode, timeStamp: $timeStamp, userCategory: $userCategory) {" +
    "    __typename" +
    "    id" +
    "    fullName" +
    "    token" +
    "    userCategory" +
    "  }" +
    "}"

  public let fullName: String
  public let emailId: String
  public let mobileNumber: String
  public let civilId: String
  public let password: String
  public let address: String
  public let city: String
  public let state: String
  public let country: String
  public let zipCode: String
  public let timeStamp: String
  public let userCategory: String

  public init(fullName: String, emailId: String, mobileNumber: String, civilId: String, password: String, address: String, city: String, state: String, country: String, zipCode: String, timeStamp: String, userCategory: String) {
    self.fullName = fullName
    self.emailId = emailId
    self.mobileNumber = mobileNumber
    self.civilId = civilId
    self.password = password
    self.address = address
    self.city = city
    self.state = state
    self.country = country
    self.zipCode = zipCode
    self.timeStamp = timeStamp
    self.userCategory = userCategory
  }

  public var variables: GraphQLMap? {
    return ["fullName": fullName, "emailId": emailId, "mobileNumber": mobileNumber, "civilId": civilId, "password": password, "address": address, "city": city, "state": state, "country": country, "zipCode": zipCode, "timeStamp": timeStamp, "userCategory": userCategory]
  }

  public struct Data: GraphQLMappable {
    public let userSignup: UserSignup?

    public init(reader: GraphQLResultReader) throws {
      userSignup = try reader.optionalValue(for: Field(responseName: "userSignup", arguments: ["fullName": reader.variables["fullName"], "emailId": reader.variables["emailId"], "mobileNumber": reader.variables["mobileNumber"], "civilId": reader.variables["civilId"], "password": reader.variables["password"], "address": reader.variables["address"], "city": reader.variables["city"], "state": reader.variables["state"], "country": reader.variables["country"], "zipCode": reader.variables["zipCode"], "timeStamp": reader.variables["timeStamp"], "userCategory": reader.variables["userCategory"]]))
    }

    public struct UserSignup: GraphQLMappable {
      public let __typename: String
      public let id: String?
      public let fullName: String?
      public let token: String?
      public let userCategory: UserType?

      public init(reader: GraphQLResultReader) throws {
        __typename = try reader.value(for: Field(responseName: "__typename"))
        id = try reader.optionalValue(for: Field(responseName: "id"))
        fullName = try reader.optionalValue(for: Field(responseName: "fullName"))
        token = try reader.optionalValue(for: Field(responseName: "token"))
        userCategory = try reader.optionalValue(for: Field(responseName: "userCategory"))
      }
    }
  }
}

public final class StudentProfileQuery: GraphQLQuery {
  public static let operationDefinition =
    "query StudentProfile {" +
    "  me {" +
    "    __typename" +
    "    ... on Student {" +
    "      __typename" +
    "      profile {" +
    "        __typename" +
    "        city" +
    "      }" +
    "    }" +
    "  }" +
    "}"
  public init() {
  }

  public struct Data: GraphQLMappable {
    public let me: Me?

    public init(reader: GraphQLResultReader) throws {
      me = try reader.optionalValue(for: Field(responseName: "me"))
    }

    public struct Me: GraphQLMappable {
      public let __typename: String

      public let asStudent: AsStudent?

      public init(reader: GraphQLResultReader) throws {
        __typename = try reader.value(for: Field(responseName: "__typename"))

        asStudent = try AsStudent(reader: reader, ifTypeMatches: __typename)
      }

      public struct AsStudent: GraphQLConditionalFragment {
        public static let possibleTypes = ["Student"]

        public let __typename: String
        public let profile: Profile?

        public init(reader: GraphQLResultReader) throws {
          __typename = try reader.value(for: Field(responseName: "__typename"))
          profile = try reader.optionalValue(for: Field(responseName: "profile"))
        }

        public struct Profile: GraphQLMappable {
          public let __typename: String
          public let city: String?

          public init(reader: GraphQLResultReader) throws {
            __typename = try reader.value(for: Field(responseName: "__typename"))
            city = try reader.optionalValue(for: Field(responseName: "city"))
          }
        }
      }
    }
  }
}