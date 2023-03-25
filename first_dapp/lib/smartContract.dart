import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:dart_web3/dart_web3.dart';
import 'package:web_socket_channel/io.dart';

class SmartContract {

  
  late Client httpClient;
  late Web3Client ethClient;
  final String _rpcUrl = "http://192.168.1.85:7545";
  final String _wsUrl = "ws://192.168.1.85:7545/";
 
  

  //initialising State
  SmartContract() {
    httpClient = Client();
    ethClient = Web3Client(_rpcUrl, Client(), socketConnector: () {
      return IOWebSocketChannel.connect(_wsUrl).cast<String>();
    });
  }

  // Solidity Function Calls
  Future<DeployedContract> loadContract() async {
    String abiString = await rootBundle.loadString("build/contracts/SupplyChain.json");
    final jsonAbi = jsonDecode(abiString);
    String abi = jsonEncode(jsonAbi["abi"]);
    EthereumAddress contractAddress =
        EthereumAddress.fromHex(jsonAbi["networks"]["5777"]["address"]);
    final contract = DeployedContract(
        ContractAbi.fromJson(abi, 'SupplyChain'), contractAddress);
    return contract;
  }

    Future<List<dynamic>> query(String functionName, List<dynamic> args) async {
    final contract = await loadContract();
    final ethFunction = contract.function(functionName);
    final result = await ethClient.call(
        contract: contract, function: ethFunction, params: args);
    return result;
  }

  Future<String> submit(String functionName, List<dynamic> args) async {
    EthPrivateKey credentials = EthPrivateKey.fromHex(
        "0xc135c3b0fdde7916c19535c21ff2ff8650efe0315bf0472db87afebeca58e795"); //privateKey cua 1 dia chi trong ganache
    DeployedContract contract = await loadContract();
    final ethFunction = contract.function(functionName);
    final result = await ethClient.sendTransaction(
        credentials,
        Transaction.callContract(
            contract: contract, function: ethFunction, parameters: args),
         chainId: null,
      fetchChainIdFromNetworkId: true);
    return result;
  }

  

  
}