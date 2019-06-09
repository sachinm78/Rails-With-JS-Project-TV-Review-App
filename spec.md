# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (User has_many Reviews) 
- [x] Include at least one belongs_to relationship (Review belongs_to User)
- [x] Include at least two has_many through relationships (User has_many Shows through Reviews; Shows have many Users through Reviews)
- [x] Include at least one many-to-many relationship (User has_many Shows through Reviews; Shows have many Users through Reviews)
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name reviews.rating, reviews.comment)
- [x] Include reasonable validations for simple model objects (User, Show, Review)
- [x] Include a class level ActiveRecord scope method (Review.five_stars and Review.not_rated URL: /reviews/custom_query)
- [x] Include signup (Devise)
- [x] Include login (Devise)
- [x] Include logout (Devise)
- [ ] Include third party signup/login (how e.g. Devise/OmniAuth)
- [x] Include nested resource show or index (URL: users/2/shows)
- [x] Include nested resource "new" form (URL: users/1/shows/new)
- [x] Include form display of validation errors (all forms are validating errors)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate