// Copyright 2019 The klaytn Authors
// This file is part of the klaytn library.
//
// The klaytn library is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// The klaytn library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with the klaytn library. If not, see <http://www.gnu.org/licenses/>.

package contracts

//go:generate abigen --sol ./contracts/bridge/Bridge.sol --pkg bridge --out ./bridge/Bridge.go

//go:generate abigen --sol ./contracts/extend/ExtBridge.sol --pkg extbridge --out ./extbridge/ExtBridge.go

//go:generate abigen --sol ./contracts/erc721/ServiceChainNFT.sol --pkg erc721 --out ./erc721/ServiceChainNFT.go

//go:generate abigen --sol ./contracts/erc20/ServiceChainToken.sol --pkg erc20 --out ./erc20/ServiceChainToken.go

//go:generate abigen --sol ./contracts/kip13/InterfaceIdentifier.sol --pkg kip13 --out ./kip13/InterfaceIdentifier.go
