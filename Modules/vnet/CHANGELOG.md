[[_TOC_]]

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

### Changed

### Removed
## [3.1.0] - 2021-08-25
- Terraform 1.0 compatible
- Removed layers.sh

## [1.3.0] - 2021-07-01

### Added

- added `skip_provider_registration = true` required to skip when deploying to att subscriptions


## [1.2.0] - 2021-06-17

### Added

- Support for adding service endpoints to subnets that have Private Endpoint enabled.

## [1.1.0] - 2021-02-10

### Added

- Support in kit(s) for choosing between MSI and SPN via the `useMsi` variable in the kit's Variables.yaml. No change in the layer's function.

## [0.8.0] - 2020-11-04

### Added

- KitPath override if kit is stored anywhere other than root in repo
- InputFile tfvars override to allow user defined tfvars file instead of using layername.auto.tfvars

## 2020-11-10

The layer now uses MSI rather than SPN. Your ADO agent pool must have an MSI or the layer will fail, complaining about authentication, missing service principal, etc.
SPN support is DISABLED in this version of the layer. (the variables are commented out and/or removed) If you wish to use SPN, use an earlier version or modify/customize the layer.

## [0.7.0] - 2020-10-28

### Changed

- Added data lookups for existing vnet resource.

## [0.6.0] - 2020-10-14

### Changed

- Decoupled NSG resource from networking layer.

## [0.5.0] - 2020-09-15

### Changed

- Resolve Multiple Layer Instance Issue In Layer.sh

## [0.4.0] - 2020-08-31

### Changed

- Change all layer data lookups to state instead of portal

## [0.3.0] - 2020-08-25

### Added

- Add Terraform Destroy
