# Sample GitHub Attestations App

## Description

A brief description of your app goes here.

## Features

- Feature 1
- Feature 2
- Feature 3

## Installation

1. Clone the repository: `git clone https://github.com/your-username/your-repo.git`
2. Install dependencies: `npm install`

## Usage

1. Run the app: `npm start`
2. Open your browser and navigate to `http://localhost:3000`

## Contributing

Contributions are welcome! Please follow the guidelines in [CONTRIBUTING.md](CONTRIBUTING.md).

## License

This project is licensed under the [MIT License](LICENSE).

## Verifying

To verify the attestations, you can run the following commands:

```bash
# To verify the owner is Liatrio
gh attestation verify oci://ghcr.io/liatrio/tag-automated-governance-github-attestations-beta:{tag} --owner liatrio
# To verify the package was built from a repo 
gh attestation verify oci://ghcr.io/liatrio/tag-automated-governance-github-attestations-beta:{tag} --repo liatrio/tag-automated-governance-github-attestations-beta
# To export the attesttation in JSON format
gh attestation verify oci://ghcr.io/liatrio/tag-automated-governance-github-attestations-beta:{tag} --owner liatrio --format json
# To verify it with a rego policy
gh attestation verify oci://ghcr.io/liatrio/tag-automated-governance-github-attestations-beta:{tag} --owner liatrio --format json | opa eval --stdin-input -f raw -d policy.rego "data.attestation.slsa1.allow == true"
```