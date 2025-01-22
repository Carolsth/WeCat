Feature: User registration
  As a user looking to adopt or provide cats for adoption
  I want to register in the system
  So that I can manage my adoption-related activities

  Scenario: Successful user registration as an adopter
    Given I am on the registration page
    When I fill in "Nome" with "Adotante"
    When I fill in "Email" with "adopter@example.com"
    And I fill in "Senha" with "password123"
    And I select "Adotante" as my role_cat
    And I click on "Cadastrar"
    Then I should see a confirmation message "Seja bem-vindo! Os gatinhos estão te esperando"
