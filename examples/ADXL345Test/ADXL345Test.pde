/**************************************************************************
 *                                                                         *
 * ADXL345 Driver for Arduino                                              *
 *                                                                         *
 ***************************************************************************
 *                                                                         * 
 * This program is free software; you can redistribute it and/or modify    *
 * it under the terms of the MIT License.                                  *
 * This program is distributed in the hope that it will be useful,         *
 * but WITHOUT ANY WARRANTY; without even the implied warranty of          *
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           *
 * GNU General Public License for more details.                            *
 *                                                                         *
 ***************************************************************************
 * 
 * Revision History
 * 
 * Date  By What
 * 20100515 TJS Initial Creation 
 */
#include "Wire.h"
#include "ADXL345.h"

ADXL345 Accel;

void setup(){
  Serial.begin(57600);
  delay(1);
  Wire.begin();
  delay(1);
  Serial.println("Here");
   
  Serial.print("BW_OK? ");
  Serial.println(Accel.set_bw(ADXL345_BW_12), DEC);
  delay(1000);
}

void loop(){
  int i;
  double acc_data[3];

  if(Accel.get_gs(acc_data)){
    float length = 0.;
    for(i = 0; i < 3; i++){
      length += (float)acc_data[i] * (float)acc_data[i];
      Serial.print(acc_data[i]);
      Serial.print(" ");
    }
    length = sqrt(length);
    Serial.print(length);
    Serial.println("");
    delay(40);
  }
  else{
    Serial.println("ERROR: ADXL345 data read error");
  }
}
