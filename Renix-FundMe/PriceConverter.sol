// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

interface AggregatorV3Interface {

  function decimals() external view returns (uint8);
  function description() external view returns (string memory);
  function version() external view returns (uint256);

  function getRoundData(uint80 _roundId)
    external
    view
    returns (
      uint80 roundId,
      int256 answer,
      uint256 startedAt,
      uint256 updatedAt,
      uint80 answeredInRound
    );
  function latestRoundData()
    external
    view
    returns (
      uint80 roundId,
      int256 answer,
      uint256 startedAt,
      uint256 updatedAt,
      uint80 answeredInRound
    );

}

library PriceConverter{
    function getPrice() internal view returns (uint256){
        //address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        //ABI
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 price,,,) = priceFeed.latestRoundData();
        //price of eth in usd 2000.00000000
        return uint256(price* 1e10);
    }

    function getConversionRate(uint256 ethAmount) internal  view returns (uint256){
        //ETH?
        //2000_000000000000000000
        uint256 ethPrice = getPrice();
        //(2000_000000000000000000*1_000000000000000000)/1e18;
        //$2000 = 1ETH
        uint256 ethAmountInUSD = ( ethPrice * ethAmount )/1e18;
        return ethAmountInUSD;
    }

    function getVersion() internal view returns (uint256){
        return  AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();       
    }
}
