# juice-svg-template
Template for creating [custom Token URI resolvers](https://github.com/jbx-protocol/juice-token-resolver/) for Juicebox projects. 

If you want to create your own custom Token Resolver for a Juicebox project, you're in the right place. This repo gives you a contract with the basics you'll need to deploy an IJBTokenUriResolverbare contract. Follow the *Usage* instructions below to deploy and configure your Juicebox project to use your custom Token Resolver.

## Before you start
1. Install [Foundry](https://book.getfoundry.sh/getting-started/installation).
2. Install [Yarn Classic](https://classic.yarnpkg.com/en/docs/install#mac-stable). 

## Usage
1. Install dependencies with `forge install && yarn install`
2. Write your own resolver in MyTokenResolver.sol
3. Deploy with `forge script script/Deploy.s.sol`. You'll have to pass a private key or use a wallet, too. [See the Foundry Book](https://book.getfoundry.sh/reference/forge/forge-script#wallet-options---raw) for details on deploying with different types of private keys.
4. Set the resolver for your project. Send a `setTokenUriResolverForProject(uint256 _projectId, IJBTokenUriResolver _resolver)` transaction to the the [JB Token Resolver](https://docs.juicebox.money/dev/extensions/juice-token-resolver/tokenuriresolver/#settokenuriresolverforproject), passing your new contract's address as the argument. You can use [Etherscan](https://etherscan.io/address/0x2c39bb41e2af6bec6c3bb102c07c15eda648a366#writeContract#F3) or [Etherfunk](https://etherfunk.io/address/0x2c39bb41e2af6bec6c3bb102c07c15eda648a366?fn=setTokenUriResolverForProject) to send this tx.

Note: `foundry.toml`'s allows Forge to find libs in `/node_modules` without an explicit remapping. For this reason there is no remappings.txt needed. 

## Other resources
- [JB Token Resolver docs](https://docs.juicebox.money/dev/extensions/juice-token-resolver/tokenuriresolver/)
- [Template](https://github.com/nnnnicholas/juice-token-resolver-template) for creating your own Token Resolver
- [Template](https://github.com/nnnnicholas/juice-svg-template) for creating onchain SVGs based on Juicebox data