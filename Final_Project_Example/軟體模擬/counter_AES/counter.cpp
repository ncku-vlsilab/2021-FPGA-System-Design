#include<iostream>
#include<fstream>
#include <vector>
#include<string>
#include<math.h>


using namespace std;

int main(){

	ifstream file_input;
	ofstream file_output;
	//read SBOX
	file_input.open("SBOX.txt");
	char temp1 = ' ', temp2 = ' ';
	int sbox[16][16] = {};

		for (int i = 0; i < 16; i++){
			for (int j = 0; j < 16; j++){
				file_input >> temp1;
				file_input >> temp2;
				//cout << temp1 << endl;
				if (temp1 <= 57)
					temp1 = temp1 - 48;
				else temp1 = temp1 - 55;
				if (temp2 <= 57)
					temp2 = temp2 - 48;
				else temp2 = temp2 - 55;
				sbox[i][j] = temp1 * 16 + temp2;
			}
		}
	
	/*cout<<"sbox"<<endl;
	for (int i = 0; i < 16; i++){
		for (int j = 0; j < 16; j++){
			cout << 16 * i + j + 1 <<": "<< sbox[i][j] << endl;
		}
		}
		*/
	file_input.close();

	//read counter1
	file_input.open("counter1.txt");
	temp1 = 0, temp2 = 0;
	int counter1[4][4] = {};
	for (int i = 0; i < 4; i++){
		for (int j = 0; j < 4; j++){
			file_input >> temp1;
			file_input >> temp2;
			if (temp1 <= 57)
				temp1 = temp1 - 48;
			else temp1 = temp1 - 55;
			if (temp2 <= 57)
				temp2 = temp2 - 48;
			else temp2 = temp2 - 55;
			counter1[i][j] = temp1 * 16 + temp2;
		}
	}
	/*cout<<"counter1"<<endl;
	for (int i = 0; i < 4; i++){
	for (int j = 0; j < 4; j++){
	cout << counter1[i][j] << endl;
	}
	}*/
	file_input.close();

	//read counter2
	file_input.open("counter2.txt");
	temp1 = 0, temp2 = 0;
	int counter2[4][4] = {};
	for (int i = 0; i < 4; i++){
		for (int j = 0; j < 4; j++){
			file_input >> temp1;
			file_input >> temp2;
			if (temp1 <= 57)
				temp1 = temp1 - 48;
			else temp1 = temp1 - 55;
			if (temp2 <= 57)
				temp2 = temp2 - 48;
			else temp2 = temp2 - 55;
			counter2[i][j] = temp1 * 16 + temp2;
		}
	}
	/*cout<<"counter2"<<endl;
	for (int i = 0; i < 4; i++){
	for (int j = 0; j < 4; j++){
	cout << counter2[i][j] << endl;
	}
	}*/
	file_input.close();

		//read counter3
	file_input.open("counter3.txt");
	temp1 = 0, temp2 = 0;
	int counter3[4][4] = {};
	for (int i = 0; i < 4; i++){
		for (int j = 0; j < 4; j++){
			file_input >> temp1;
			file_input >> temp2;
			if (temp1 <= 57)
				temp1 = temp1 - 48;
			else temp1 = temp1 - 55;
			if (temp2 <= 57)
				temp2 = temp2 - 48;
			else temp2 = temp2 - 55;
			counter3[i][j] = temp1 * 16 + temp2;
		}
	}
	/*cout<<"counter3"<<endl;
	for (int i = 0; i < 4; i++){
	for (int j = 0; j < 4; j++){
	cout << counter3[i][j] << endl;
	}
	}*/
	file_input.close();

	//read CipherKey
	file_input.open("CipherKey.txt");
	temp1 = 0, temp2 = 0;
	int CipherKey[4][4] = {};
	for (int i = 0; i < 4; i++){
		for (int j = 0; j < 4; j++){
			file_input >> temp1;
			file_input >> temp2;
			if (temp1 <= 57)
				temp1 = temp1 - 48;
			else temp1 = temp1 - 55;
			if (temp2 <= 57)
				temp2 = temp2 - 48;
			else temp2 = temp2 - 55;
			CipherKey[i][j] = temp1 * 16 + temp2;
		}
	}
	/*cout<<"CipherKey"<<endl;
	for (int i = 0; i < 4; i++){
	for (int j = 0; j < 4; j++){
	cout << CipherKey[i][j] << endl;
	}
	}*/
	file_input.close();

		//read roundkey
	file_input.open("Roundkey1.txt");
	int roundkey[40][4] = {};

	string r;

	for(int i=0;i<40;i++){
		for(int j=0;j<4;j++){
			getline(file_input,r,'\n');
			roundkey[i][j]=atoi(r.c_str());
		}
	}

	/*cout<<"Roundkey"<<endl;
	for (int i = 0; i < 40; i++){
	for (int j = 0; j < 4; j++){
	cout << roundkey[i][j] << endl;
	}
	}*/
	file_input.close();
	
	
	
	file_input.open("counter.txt");
	temp1 = 0, temp2 = 0;
	int counter[4][4] = {};
	for (int i = 0; i < 4; i++){
		for (int j = 0; j < 4; j++){
			file_input >> temp1;
			file_input >> temp2;
			if (temp1 <= 57)
				temp1 = temp1 - 48;
			else temp1 = temp1 - 55;
			if (temp2 <= 57)
				temp2 = temp2 - 48;
			else temp2 = temp2 - 55;
			counter[i][j] = temp1 * 16 + temp2;
		}
	}
	/*for (int i = 0; i < 4; i++){
	for (int j = 0; j < 4; j++){
	cout << counter[i][j] << endl;
	}
	}*/
	file_input.close();
//**************************************************************************************************
	/*counter[3][2] = 3;
	for (int i = 0; i < 4; i++){
	for (int j = 0; j < 4; j++){
	cout << counter[i][j] << endl;
	}
	}*/
	file_output.open("AES_final_all.txt");
	for (int g = 0; g < 57604; g++){
		cout << counter[3][2] << endl;
		cout << counter[3][3] << endl;
		if (counter[3][2] == 255 && counter[3][3] == 255){
			counter[3][2] = 0;
			counter[3][3] = 0;
			counter[3][1]++;
		}
		
		else if (counter[3][3] == 255){
			counter[3][3] = 0;
			counter[3][2]++;
		}
		else counter[3][3] = counter[3][3] + 1;

		/*if (counter[3][2] == 1 && counter[3][3] == 0)
			cout << "a";*/
		/*for (int i = 0; i < 4; i++){
		for (int j = 0; j < 4; j++){
		cout << counter[i][j] << endl;
		}
		}*/
		//**************************************************************************************************
		//-------------------------------------------------------------------------------------------------------------
		int state[4][4] = {};
		//AddRoundKey
		for (int i = 0; i < 4; i++){
			for (int j = 0; j < 4; j++){
				state[i][j] = counter[i][j] ^ CipherKey[i][j];
				//cout << state[i][j] / 16 << " " << state[i][j] % 16 << endl;
			}
		}
		/*cout<<"addroundkey"<<endl;
		for (int j = 0; j < 4; j++){
		for (int k = 0; k < 4; k++){
		cout<<state[j][k] <<" ";
		}cout << endl;
		}
		cout << endl;*/
		/*file_output.open("state_AddroundKey31.txt");
		for (int i = 0; i < 4; i++){
		for (int j = 0; j < 4; j++){
		file_output << state[i][j] << endl;
		}
		}
		file_output.close();
		*/
		//*******************************AESx9***************************************
		for (int a = 0; a < 9; a++){
			//---------------------SubBytes---------------------------------------------------------------------------------
			for (int j = 0; j < 4; j++){
				for (int k = 0; k < 4; k++){
					state[j][k] = sbox[(state[j][k] / 16)][(state[j][k] % 16)];
				}
			}
			/*cout<<"subByte"<<endl;
			for (int j = 0; j < 4; j++){
			for (int k = 0; k < 4; k++){
			cout<<state[j][k] <<" ";
			}cout << endl;
			}
			cout << endl;*/
			/*if(a==0){
				file_output.open("state_SubBytes31.txt");
				for (int i = 0; i < 4; i++){
				for (int j = 0; j < 4; j++){
				file_output << state[i][j] << endl;
				}
				}
				file_output.close();
				}*/
			//---------------------------------------------------------------------------------------------------------------------
			//----------------------ShiftRows--------------------------------------------------------------------------------------
			int shift_temp = 0, shift_temp1 = 0;
			shift_temp = state[1][0];
			state[1][0] = state[1][1];
			state[1][1] = state[1][2];
			state[1][2] = state[1][3];
			state[1][3] = shift_temp;

			shift_temp = state[2][0];
			state[2][0] = state[2][2];
			shift_temp1 = state[2][1];
			state[2][1] = state[2][3];
			state[2][2] = shift_temp;
			state[2][3] = shift_temp1;

			shift_temp = state[3][0];
			state[3][0] = state[3][3];
			state[3][3] = state[3][2];
			state[3][2] = state[3][1];
			state[3][1] = shift_temp;

			/*cout<<"ShiftRows"<<endl;
			for (int j = 0; j < 4; j++){
			for (int k = 0; k < 4; k++){
			cout << state[j][k] << " ";
			}cout << endl;
			}
			cout << endl;*/
			/*if(a==0){
				file_output.open("state_ShiftRows31.txt");
				for (int i = 0; i < 4; i++){
				for (int j = 0; j < 4; j++){
				file_output << state[i][j] << endl;
				}
				}
				file_output.close();
				}*/
			//----------------------------------------------------------------------------------------------------------
			//------------------mixColumn-------------------------------------------------------------------------------
			int mix_temp[4] = {};
			int state_temp[3] = {};
			for (int j = 0; j < 4; j++){
				for (int i = 0; i < 4; i++){
					if (state[i][j] >= 128){
						mix_temp[i] = state[i][j] * 2 - 256;//shift left
						mix_temp[i] = mix_temp[i] ^ 27;
					}
					else mix_temp[i] = state[i][j] * 2;//shift left
				}
				state_temp[0] = state[0][j];
				state_temp[1] = state[1][j];
				state_temp[2] = state[2][j];
				state[0][j] = mix_temp[0] ^ mix_temp[1] ^ state[1][j] ^ state[2][j] ^ state[3][j];
				state[1][j] = mix_temp[1] ^ mix_temp[2] ^ state_temp[2] ^ state_temp[0] ^ state[3][j];
				state[2][j] = mix_temp[2] ^ mix_temp[3] ^ state[3][j] ^ state_temp[0] ^ state_temp[1];
				state[3][j] = mix_temp[3] ^ mix_temp[0] ^ state_temp[0] ^ state_temp[1] ^ state_temp[2];
			}
			/*cout<<"MixColumn"<<endl;
			for (int j = 0; j < 4; j++){
			for (int k = 0; k < 4; k++){
			cout << state[j][k] << " ";
			}cout << endl;
			}
			cout << endl;*/
			/*if(a==0){
				file_output.open("state_MixCo1umn31.txt");
				for (int i = 0; i < 4; i++){
				for (int j = 0; j < 4; j++){
				file_output << state[i][j] << endl;
				}
				}
				file_output.close();
				}*/
			//--------------------------------------------------------------------------------------------------------
			//----------------------AddRoundKey------------------------------------------------------------------------
			for (int i = 0; i < 4; i++){
				for (int j = 0; j < 4; j++){
					state[i][j] = state[i][j] ^ roundkey[4 * a + i][j];
					//cout << state[i][j] / 16 << " " << state[i][j] % 16 << endl;
				}
			}
			/*cout<<"RoundKey"<<endl;
			for (int j = 4*a; j < 4*(a+1); j++){
			for (int k = 0; k < 4; k++){
			cout << roundkey[j][k] << " ";
			}cout << endl;
			}
			cout << endl;

			cout<<"AddRoundKey"<<endl;
			for (int j = 0; j < 4; j++){
			for (int k = 0; k < 4; k++){
			cout << state[j][k] << " ";
			}cout << endl;
			}
			cout << endl;*/
			/*if(a==0){
				file_output.open("state_AddRoundKey32.txt");
				for (int i = 0; i < 4; i++){
				for (int j = 0; j < 4; j++){
				file_output << state[i][j] << endl;
				}
				}
				file_output.close();
				}
				if(a==9){
				file_output.open("state_AddRoundKey33.txt");
				for (int i = 0; i < 4; i++){
				for (int j = 0; j < 4; j++){
				file_output << state[i][j] << endl;
				}
				}
				file_output.close();
				}*/
		}
		//*********************AESx10 END*********************************************************
		//-------------------------------------------------------------------------------------------------------
		//-----------------------SubBytes-------------------------------------------------------------------------
		for (int j = 0; j < 4; j++){
			for (int k = 0; k < 4; k++){
				state[j][k] = sbox[(state[j][k] / 16)][(state[j][k] % 16)];
			}
		}
		//cout<<"subByte"<<endl;
		/*for (int j = 0; j < 4; j++){
			for (int k = 0; k < 4; k++){
			cout<<state[j][k] <<" ";
			}cout << endl;
			}
			cout << endl;*/
		//----------------------------------------------------------------------------------------------------------
		//--------------------------ShiftRows------------------------------------------------------------------------
		int shift_temp = 0, shift_temp1 = 0;
		shift_temp = state[1][0];
		state[1][0] = state[1][1];
		state[1][1] = state[1][2];
		state[1][2] = state[1][3];
		state[1][3] = shift_temp;

		shift_temp = state[2][0];
		state[2][0] = state[2][2];
		shift_temp1 = state[2][1];
		state[2][1] = state[2][3];
		state[2][2] = shift_temp;
		state[2][3] = shift_temp1;

		shift_temp = state[3][0];
		state[3][0] = state[3][3];
		state[3][3] = state[3][2];
		state[3][2] = state[3][1];
		state[3][1] = shift_temp;

		/*cout<<"ShiftRows"<<endl;
		for (int j = 0; j < 4; j++){
		for (int k = 0; k < 4; k++){
		cout << state[j][k] << " ";
		}cout << endl;
		}
		cout << endl;*/
		//---------------------------------------------------------------------------------------------------------------
		//------------------------AddRoundKey-----------------------------------------------------------------------------
		for (int i = 0; i < 4; i++){
			for (int j = 0; j < 4; j++){
				state[i][j] = state[i][j] ^ roundkey[i + 36][j];
				//cout << state[i][j] / 16 << " " << state[i][j] % 16 << endl;
			}
		}
		/*cout<<"RoundKey"<<endl;
		for (int j = 36; j < 40; j++){
		for (int k = 0; k < 4; k++){
		cout << roundkey[j][k] << " ";
		}cout << endl;
		}
		cout << endl;

		cout<<"AddRoundKey"<<endl;
		for (int j = 0; j < 4; j++){
		for (int k = 0; k < 4; k++){
		cout << state[j][k] << " ";
		}cout << endl;
		}
		cout << endl;*/
		//********************************************************************************************
		

			for (int i = 0; i < 4; i++){
				for (int j = 0; j < 4; j++){
					file_output << state[i][j] << endl;
				}
			}

		

	}
//*********************************************************************************************
//--------------------------------------------------------------------------------------------------------------------------
	file_output.close();

	system("pause");
	return 0;
}