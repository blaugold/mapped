Work with Mapbox styles in Dart

- A Mapbox style must adhere to the Mapbox style specification.
- A Mapbox style must be valid JSON.
- Based on the spec, we can define a type system that will be able to enforce
  most of the rules in the spec.
- Rules which would make the type system overly complex are implemented as
  separate checks of a Mapbox style instance.
- We want to have a representation of the Mapbox style in Dart.
  - Users want to fully specify a style in Dart.
  - Users want to read a style in Dart.
  - Users want to modify an existing style in Dart.
  - Users want to parse a Mapbox style from JSON to its Dart representation.
  - Users want to validate a Mapbox style.
  - Users want to work with a Mapbox style in a type safe way.
    - Detect errors through the type system.
    - View docs in IDE.
    - Discover API through the IDE.
- We want to be able to use partially invalid Mapbox styles.
  - If a value cannot be parsed or is invalid, and the value has a default
    value, we should use the default value.
  - If a value cannot be parsed or is invalid, and the value has no default
    value but is not required, we should leave the value as null.
  - If a value cannot be parsed or is invalid, and the value is required, we
    cannot use the style.

# Feature of the Dart representation

- mutable
- new objects are created without defaults
- every field is nullable
- objects implement the visitor pattern
- objects can be (deeply) frozen
- objects ban be (deeply) copied
- Phases
  - Parsing
  - Apply defaults
  - Validation

# TODO

- Apply defaults
- Validate
- Docs
  - Data classes
    - Properties
  - Make hrefs absolute
- equals and hashCode
- Annotate properties with metadata
  - expression
  - requirements
  - transition
- Annotate types with metadata
  - validation
- Expression type system
