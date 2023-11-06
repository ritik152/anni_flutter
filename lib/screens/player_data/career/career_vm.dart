import 'dart:convert';
import 'package:anni_ai/apis/api_controller.dart';
import 'package:anni_ai/screens/player_data/career/career_model.dart';
import 'package:flutter/material.dart';

import '../../../utils/common.dart';
import '../table_list/table_model.dart';

class CareerVm {

  var isLoading = (careerModel.body == null || careerModel.body!.isEmpty)?true:false;

  Future<bool> getTableListWeek(BuildContext context, String playerId, String teamId, String position) async {

    String res = await getMethodWithQuery("GET", "getCareer?PlayerID=$playerId&TeamID=$teamId&Position=$position", null, context);

    var response = jsonDecode(res);

    isLoading = false;

    careerModel = CareerModel.fromJson(response);

    for(var i = 0; i < careerModel.body!.length; i++){

      //---------------------------------------------------------------------Rushing Attempts--------------------------------------
      if(double.parse(careerModel.body![i].comparingData!.rushingAttempts.toString()) > double.parse(careerModel.body![i].rushing!.rushingAttempts.toString())){
        double value = (double.parse(careerModel.body![i].comparingData!.rushingAttempts.toString()) / double.parse(careerModel.body![i].rushing!.rushingAttempts.toString())) * 100;

        if(value < 75){
          careerModel.body![i].rushing!.colourRushingAttempts = "green";
        }else if (value < 75 &&  value > 30){
          careerModel.body![i].rushing!.colourRushingAttempts = "yallow";
        }else{
          careerModel.body![i].rushing!.colourRushingAttempts = "red";
        }

      }
      else{
        careerModel.body![i].rushing!.colourRushingAttempts = "green";
      }

      //---------------------------------------------------------------------Rushing Yards--------------------------------------

      if(double.parse(careerModel.body![i].comparingData!.rushingYards.toString()) > double.parse(careerModel.body![i].rushing!.rushingYards.toString())){
        double value = (double.parse(careerModel.body![i].comparingData!.rushingYards.toString()) / double.parse(careerModel.body![i].rushing!.rushingYards.toString())) * 100;

        if(value < 75){
          careerModel.body![i].rushing!.colourRushingYards = "green";
        }else if (value < 75 &&  value > 30){
          careerModel.body![i].rushing!.colourRushingYards = "yallow";
        }else{
          careerModel.body![i].rushing!.colourRushingYards = "red";
        }

      }
      else{
        careerModel.body![i].rushing!.colourRushingYards = "green";
      }

      //---------------------------------------------------------------------Rushing YardsPerAttempt--------------------------------------

      if(double.parse(careerModel.body![i].comparingData!.rushingYardsPerAttempt.toString()) > double.parse(careerModel.body![i].rushing!.rushingYardsPerAttempt.toString())){
        double value = (double.parse(careerModel.body![i].comparingData!.rushingYardsPerAttempt.toString()) / double.parse(careerModel.body![i].rushing!.rushingYardsPerAttempt.toString())) * 100;

        if(value < 75){
          careerModel.body![i].rushing!.colourRushingYardsPerAttempt = "green";
        }else if (value < 75 &&  value > 30){
          careerModel.body![i].rushing!.colourRushingYardsPerAttempt = "yallow";
        }else{
          careerModel.body![i].rushing!.colourRushingYardsPerAttempt = "red";
        }

      }
      else{
        careerModel.body![i].rushing!.colourRushingYardsPerAttempt = "green";
      }

      //---------------------------------------------------------------------Rushing Touchdowns--------------------------------------

      if(double.parse(careerModel.body![i].comparingData!.rushingTouchdowns.toString()) > double.parse(careerModel.body![i].rushing!.rushingTouchdowns.toString())){
        double value = (double.parse(careerModel.body![i].comparingData!.rushingTouchdowns.toString()) / double.parse(careerModel.body![i].rushing!.rushingTouchdowns.toString())) * 100;

        if(value < 75){
          careerModel.body![i].rushing!.colourRushingTouchdowns = "green";
        }else if (value < 75 &&  value > 30){
          careerModel.body![i].rushing!.colourRushingTouchdowns = "yallow";
        }else{
          careerModel.body![i].rushing!.colourRushingTouchdowns = "red";
        }

      }
      else{
        careerModel.body![i].rushing!.colourRushingTouchdowns = "green";
      }



      //---------------------------------------------------------------------Receiving Targets--------------------------------------

      if(double.parse(careerModel.body![i].comparingData!.receivingTargets.toString()) > double.parse(careerModel.body![i].receiving!.receivingTargets.toString())){
        double value = (double.parse(careerModel.body![i].comparingData!.receivingTargets.toString()) / double.parse(careerModel.body![i].receiving!.receivingTargets.toString())) * 100;

        if(value < 75){
          careerModel.body![i].receiving!.receivingTargetsC = "green";
        }else if (value < 75 &&  value > 30){
          careerModel.body![i].receiving!.receivingTargetsC = "yallow";
        }else{
          careerModel.body![i].receiving!.receivingTargetsC = "red";
        }

      }
      else{
        careerModel.body![i].receiving!.receivingTargetsC = "green";
      }

      //---------------------------------------------------------------------Receiving receptions--------------------------------------

      if(double.parse(careerModel.body![i].comparingData!.receptions.toString()) > double.parse(careerModel.body![i].receiving!.receptions.toString())){
        double value = (double.parse(careerModel.body![i].comparingData!.receptions.toString()) / double.parse(careerModel.body![i].receiving!.receptions.toString())) * 100;

        if(value < 75){
          careerModel.body![i].receiving!.receptionsC = "green";
        }else if (value < 75 &&  value > 30){
          careerModel.body![i].receiving!.receptionsC = "yallow";
        }else{
          careerModel.body![i].receiving!.receptionsC = "red";
        }

      }
      else{
        careerModel.body![i].receiving!.receptionsC = "green";
      }

      //---------------------------------------------------------------------Receiving receivingYards--------------------------------------

      if(double.parse(careerModel.body![i].comparingData!.receivingYards.toString()) > double.parse(careerModel.body![i].receiving!.receivingYards.toString())){
        double value = (double.parse(careerModel.body![i].comparingData!.receivingYards.toString()) / double.parse(careerModel.body![i].receiving!.receivingYards.toString())) * 100;

        if(value < 75){
          careerModel.body![i].receiving!.receivingYardsC = "green";
        }else if (value < 75 &&  value > 30){
          careerModel.body![i].receiving!.receivingYardsC = "yallow";
        }else{
          careerModel.body![i].receiving!.receivingYardsC = "red";
        }

      }
      else{
        careerModel.body![i].receiving!.receivingYardsC = "green";
      }

      //---------------------------------------------------------------------Receiving receivingYardsPerReception--------------------------------------

      if(double.parse(careerModel.body![i].comparingData!.receivingYardsPerReception.toString()) > double.parse(careerModel.body![i].receiving!.receivingYardsPerReception.toString())){
        double value = (double.parse(careerModel.body![i].comparingData!.receivingYardsPerReception.toString()) / double.parse(careerModel.body![i].receiving!.receivingYardsPerReception.toString())) * 100;

        if(value < 75){
          careerModel.body![i].receiving!.receivingYardsPerReceptionC = "green";
        }else if (value < 75 &&  value > 30){
          careerModel.body![i].receiving!.receivingYardsPerReceptionC = "yallow";
        }else{
          careerModel.body![i].receiving!.receivingYardsPerReceptionC = "red";
        }

      }
      else{
        careerModel.body![i].receiving!.receivingYardsPerReceptionC = "green";
      }

      //---------------------------------------------------------------------Receiving receivingTouchdowns--------------------------------------

      if(double.parse(careerModel.body![i].comparingData!.receivingTouchdowns.toString()) > double.parse(careerModel.body![i].receiving!.receivingTouchdowns.toString())){
        double value = (double.parse(careerModel.body![i].comparingData!.receivingTouchdowns.toString()) / double.parse(careerModel.body![i].receiving!.receivingTouchdowns.toString())) * 100;

        if(value < 75){
          careerModel.body![i].receiving!.receivingTouchdownsC = "green";
        }else if (value < 75 &&  value > 30){
          careerModel.body![i].receiving!.receivingTouchdownsC = "yallow";
        }else{
          careerModel.body![i].receiving!.receivingTouchdownsC = "red";
        }

      }
      else{
        careerModel.body![i].receiving!.receivingTouchdownsC = "green";
      }



      //---------------------------------------------------------------------Passing passingAttempts--------------------------------------

      if(double.parse(careerModel.body![i].comparingData!.passingAttempts.toString()) > double.parse(careerModel.body![i].passing!.passingAttempts.toString())){
        double value = (double.parse(careerModel.body![i].comparingData!.passingAttempts.toString()) / double.parse(careerModel.body![i].passing!.passingAttempts.toString())) * 100;

        if(value < 75){
          careerModel.body![i].passing!.passingAttemptsC = "green";
        }else if (value < 75 &&  value > 30){
          careerModel.body![i].passing!.passingAttemptsC = "yallow";
        }else{
          careerModel.body![i].passing!.passingAttemptsC = "red";
        }

      }
      else{
        careerModel.body![i].passing!.passingAttemptsC = "green";
      }

      //---------------------------------------------------------------------Passing passingCompletionsC--------------------------------------

      if(double.parse(careerModel.body![i].comparingData!.passingCompletions.toString()) > double.parse(careerModel.body![i].passing!.passingCompletions.toString())){
        double value = (double.parse(careerModel.body![i].comparingData!.passingCompletions.toString()) / double.parse(careerModel.body![i].passing!.passingCompletions.toString())) * 100;

        if(value < 75){
          careerModel.body![i].passing!.passingCompletionsC = "green";
        }else if (value < 75 &&  value > 30){
          careerModel.body![i].passing!.passingCompletionsC = "yallow";
        }else{
          careerModel.body![i].passing!.passingCompletionsC = "red";
        }

      }
      else{
        careerModel.body![i].passing!.passingCompletionsC = "green";
      }

      //---------------------------------------------------------------------Passing passingYards--------------------------------------

      if(double.parse(careerModel.body![i].comparingData!.passingYards.toString()) > double.parse(careerModel.body![i].passing!.passingYards.toString())){
        double value = (double.parse(careerModel.body![i].comparingData!.passingYards.toString()) / double.parse(careerModel.body![i].passing!.passingYards.toString())) * 100;

        if(value < 75){
          careerModel.body![i].passing!.passingYardsC = "green";
        }else if (value < 75 &&  value > 30){
          careerModel.body![i].passing!.passingYardsC = "yallow";
        }else{
          careerModel.body![i].passing!.passingYardsC = "red";
        }

      }
      else{
        careerModel.body![i].passing!.passingYardsC = "green";
      }

       //---------------------------------------------------------------------Passing passingTouchdowns--------------------------------------

      if(double.parse(careerModel.body![i].comparingData!.passingTouchdowns.toString()) > double.parse(careerModel.body![i].passing!.passingTouchdowns.toString())){
        double value = (double.parse(careerModel.body![i].comparingData!.passingTouchdowns.toString()) / double.parse(careerModel.body![i].passing!.passingTouchdowns.toString())) * 100;

        if(value < 75){
          careerModel.body![i].passing!.passingTouchdownsC = "green";
        }else if (value < 75 &&  value > 30){
          careerModel.body![i].passing!.passingTouchdownsC = "yallow";
        }else{
          careerModel.body![i].passing!.passingTouchdownsC = "red";
        }

      }
      else{
        careerModel.body![i].passing!.passingTouchdownsC = "green";
      }

       //---------------------------------------------------------------------Passing passingInterceptions--------------------------------------

      if(double.parse(careerModel.body![i].comparingData!.passingInterceptions.toString()) > double.parse(careerModel.body![i].passing!.passingInterceptions.toString())){
        double value = (double.parse(careerModel.body![i].comparingData!.passingInterceptions.toString()) / double.parse(careerModel.body![i].passing!.passingInterceptions.toString())) * 100;

        if(value < 75){
          careerModel.body![i].passing!.passingInterceptionsC = "green";
        }else if (value < 75 &&  value > 30){
          careerModel.body![i].passing!.passingInterceptionsC = "yallow";
        }else{
          careerModel.body![i].passing!.passingInterceptionsC = "red";
        }

      }
      else{
        careerModel.body![i].passing!.passingInterceptionsC = "green";
      }


    }

    careerModel.body = careerModel.body!.reversed.toList();

    if(careerModel.code == 200){

      return true;
    }else{

      showError(careerModel.message.toString());
      return true;
    }

  }


}