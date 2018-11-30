Feature: Ngauge API Testing

  Background:
    * def data = read('./test.json');

  @CreateAccount @API
  Scenario: Create Account with Contact
    Given url "http://18.191.44.132:3000/api/accounts/createaccount"
    And request data.createAccount
    Then method POST
    Given def id = response.result.id
    Then print "id from response: "+id
    Then match response.result contains {"id":#notnull}

  @UpdateAccount @API
  Scenario: Update Account
    Given url "http://18.191.44.132:3000/api/accounts/updateaccount"
    And request data.updateAccount
    Then method POST
    Given def count = response.result.count
    Then print "response after update: "+count
    Then match response.result == {"count": 1}

   @GetAccountInfo @API
   Scenario: GetAccountInfo
     Given url "http://18.191.44.132:3000/api/accounts/getaccountinfo"
     And request data.accountInfo
     Then method POST
     Then print "response of accountInfo: "+response.result.length
     Then def length = response.result.length
     Then match $.result[0].id == data.accountInfo.accountId

  @DeleteAccount @API
  Scenario: Delete Account
    Given def id = 220
    Given url "http://18.191.44.132:3000/api/accounts/"+id
    Then method DELETE
    Then print "Deleted count: "+response.count
    Then match response == {"count": 1}

  @UpdateInvalidAccount @API
   Scenario: Update Invalid Account
     Given url "http://18.191.44.132:3000/api/accounts/updateaccount"
     And request data.updateInvalidAccount
     Then method POST
     Given def count = response.result.count
     Then print "response after update: "+count
     Then match response.result == {"count": 1}

  @InvalidDeleteAccount @API
   Scenario: Delete Account
    Given def id = 220
    Given url "http://18.191.44.132:3000/api/accounts/"+id
    Then method DELETE
    Then print "Deleted count: "+response.count
    Then match response == {"count": 1}