@applying_catalog_promotions
Feature: Applying all available catalog promotions
    In order to see products in best prices
    As a Customer
    I want to see discounted products in the catalog

    Background:
        Given the store operates on a channel named "Web-US"
        And the store classifies its products as "Clothes" and "Dishes"
        And the store has a "T-Shirt" configurable product
        And the product "T-Shirt" has a main taxon "Clothes"
        And this product has "PHP T-Shirt" variant priced at "$20.00" in "Web-US" channel
        And the store has a "Mug" configurable product
        And this product main taxon should be "Dishes"
        And this product has "Coffee Mug" variant priced at "$5.00" in "Web-US" channel
        And there is a catalog promotion "Clothes sale" that reduces price by "30%" with label "Clothes sale" and applies on "Clothes" taxonomy

    @todo
    Scenario: Applying multiple catalog promotions
        Given there is a catalog promotion "Winter sale" available in "Web-US" channel that reduces price by "30%" and applies on "PHP T-shirt" variant
        When I view shop on "Web-US" channel
        And I view product "T-Shirt"
        Then I should see the product price "$9.80"
        And I should see the product original price "$20.00"
        And I shoud see catalog promotion label "Clothes sale"
