//  This file was automatically generated and should not be edited.

import Apollo

public enum UserType: String {
  case student = "student"
  case teacher = "teacher"
  case parent = "parent"
}

extension UserType: JSONDecodable, JSONEncodable {}

public final class SignUpMutation: GraphQLMutation {
  public static let operationDefinition =
    "mutation SignUp($fullname: String!, $email: String!, $mobile: String!, $civilId: String!, $password: String!, $address: String!, $city: String!, $state: String!, $country: String!, $zipcode: String!, $timestamp: String!, $usercategory: String!) {" +
    "  userSignup(fullName: $fullname, emailId: $email, mobileNumber: $mobile, civilId: $civilId, password: $password, address: $address, city: $city, state: $state, country: $country, zipCode: $zipcode, timeStamp: $timestamp, userCategory: $usercategory) {" +
    "    __typename" +
    "    id" +
    "    token" +
    "    userCategory" +
    "    fullName" +
    "  }" +
    "}"

  public let fullname: String
  public let email: String
  public let mobile: String
  public let civilId: String
  public let password: String
  public let address: String
  public let city: String
  public let state: String
  public let country: String
  public let zipcode: String
  public let timestamp: String
  public let usercategory: String

  public init(fullname: String, email: String, mobile: String, civilId: String, password: String, address: String, city: String, state: String, country: String, zipcode: String, timestamp: String, usercategory: String) {
    self.fullname = fullname
    self.email = email
    self.mobile = mobile
    self.civilId = civilId
    self.password = password
    self.address = address
    self.city = city
    self.state = state
    self.country = country
    self.zipcode = zipcode
    self.timestamp = timestamp
    self.usercategory = usercategory
  }

  public var variables: GraphQLMap? {
    return ["fullname": fullname, "email": email, "mobile": mobile, "civilId": civilId, "password": password, "address": address, "city": city, "state": state, "country": country, "zipcode": zipcode, "timestamp": timestamp, "usercategory": usercategory]
  }

  public struct Data: GraphQLMappable {
    public let userSignup: UserSignup?

    public init(reader: GraphQLResultReader) throws {
      userSignup = try reader.optionalValue(for: Field(responseName: "userSignup", arguments: ["fullName": reader.variables["fullname"], "emailId": reader.variables["email"], "mobileNumber": reader.variables["mobile"], "civilId": reader.variables["civilId"], "password": reader.variables["password"], "address": reader.variables["address"], "city": reader.variables["city"], "state": reader.variables["state"], "country": reader.variables["country"], "zipCode": reader.variables["zipcode"], "timeStamp": reader.variables["timestamp"], "userCategory": reader.variables["usercategory"]]))
    }

    public struct UserSignup: GraphQLMappable {
      public let __typename: String
      public let id: String?
      public let token: String?
      public let userCategory: UserType?
      public let fullName: String?

      public init(reader: GraphQLResultReader) throws {
        __typename = try reader.value(for: Field(responseName: "__typename"))
        id = try reader.optionalValue(for: Field(responseName: "id"))
        token = try reader.optionalValue(for: Field(responseName: "token"))
        userCategory = try reader.optionalValue(for: Field(responseName: "userCategory"))
        fullName = try reader.optionalValue(for: Field(responseName: "fullName"))
      }
    }
  }
}
