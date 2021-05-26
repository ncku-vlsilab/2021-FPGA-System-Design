#include<iostream>
#include<fstream>
#include<string>
#include<math.h>

using namespace std;

int main(){

	ifstream file_input;
	ifstream file_input_plaintext;
	ofstream file_output;

	
	file_input.open("AES_final_all.txt");
	file_input_plaintext.open("plaintext2.txt");
	file_output.open("ciphertext_FPGA2.txt");


	for (int a = 0; a < 4; a++){
		int AES_final[4][4] = {};
		string r;
		int plaintext[4][4] = {};
		int ciphertext[4][4] = {};
		//read AES_final_all
		for (int i = 0; i < 4; i++){
			for (int j = 0; j < 4; j++){
				getline(file_input, r, '\n');
				AES_final[i][j] = atoi(r.c_str());
			}
		}

		/*for (int i = 0; i < 4; i++){
			for (int j = 0; j < 4; j++){
				cout << AES_final[i][j] << endl;
			}
		}cout << endl;*/





		//read plaintext
		char temp3 = 0, temp4 = 0;
		for (int i = 0; i < 4; i++){
			for (int j = 0; j < 4; j++){
				file_input_plaintext >> temp3;
				file_input_plaintext >> temp4;
				//cout <<temp1<<" "<<temp2<<" "<< sbox[3][12]<< " "<<plaintext[3][12]<<endl;
				if (temp3 <= 57)
					temp3 = temp3 - 48;
				else temp3 = temp3 - 87;
				if (temp4 <= 57)
					temp4 = temp4 - 48;
				else temp4 = temp4 - 87;
				plaintext[i][j] = temp3 * 16 + temp4;
			}
		}
		/*for (int i = 0; i < 4; i++){
			for (int j = 0; j < 4; j++){
				cout << plaintext[i][j] << endl;
			}
		}cout << endl;*/

		for (int i = 0; i < 4; i++){
			for (int j = 0; j < 4; j++)
				ciphertext[i][j] = plaintext[i][j] ^ AES_final[i][j];
		}

		char m,l;

		for (int i = 0; i < 4; i++){
			for (int j = 0; j < 4; j++){

				if(ciphertext[i][j]/16==10){
			  m='a';
			}
			else if(ciphertext[i][j]/16==11){
			  m='b';
			}
			else if(ciphertext[i][j]/16==12){
			  m='c';
			}
			else if(ciphertext[i][j]/16==13){
			  m='d';
			}
			else if(ciphertext[i][j]/16==14){
			  m='e';
			}
			else if(ciphertext[i][j]/16==15){
			  m='f';
			}
			else {
			  m=ciphertext[i][j]/16+'0';
			}

			if(ciphertext[i][j]%16==10){
			  l='a';
			}
			else if(ciphertext[i][j]%16==11){
			  l='b';
			}
			else if(ciphertext[i][j]%16==12){
			  l='c';
			}
			else if(ciphertext[i][j]%16==13){
			  l='d';
			}
			else if(ciphertext[i][j]%16==14){
			  l='e';
			}
			else if(ciphertext[i][j]%16==15){
			  l='f';
			}
			else {
			  l=ciphertext[i][j]%16+'0';
			}

			file_output << m << l << endl;

				//file_output << ciphertext[i][j]/*/16 << ciphertext[i][j]%16*/ << endl;
			}
		}


	}
	
	
	file_input_plaintext.close();
	file_input.close();
	file_output.close();


	system("pause");
	return 0;

}