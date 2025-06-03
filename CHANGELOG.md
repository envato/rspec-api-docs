# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [1.1.0.2] - 2025-06-03

### Changed
- Made it work with Ruby 3.4 and latest `rack` gem ([PR](https://github.com/envato/rspec-api-docs/pull/1))

## [1.1.0.1] - 2022-03-10

### Changed
- Envato forked this gem
- Replaced `*args` with `...` to support Ruby 3.x ([commit](https://github.com/envato/rspec-api-docs/commit/e412c6b3cc577e72b8c137c3622b44fe0da0bc5b))

## [1.1.0] - 2018-11-02

### Changed
- Relax JSON Content-Type check to work with custom MIME types [#13] ([@2potatocakes])

## [1.0.0] - 2018-09-24

### Changed
- The JSON response body will only be documented when the content type is `application/json` [#12] ([@2potatocakes])

## [0.14.0] - 2018-07-21

### Added
- This CHANGELOG file.

### Changed
- Include the request body in the generated JSON [#9] ([@2potatocakes])

[Unreleased]: https://github.com/twe4ked/rspec-api-docs/compare/v1.1.0...HEAD
[1.1.0]: https://github.com/twe4ked/rspec-api-docs/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/twe4ked/rspec-api-docs/compare/v0.14.0...v1.0.0
[0.14.0]: https://github.com/twe4ked/rspec-api-docs/compare/v0.13.0...v0.14.0

[#9]: https://github.com/twe4ked/rspec-api-docs/pull/9
[#12]: https://github.com/twe4ked/rspec-api-docs/pull/12
[@2potatocakes]: https://github.com/2potatocakes
