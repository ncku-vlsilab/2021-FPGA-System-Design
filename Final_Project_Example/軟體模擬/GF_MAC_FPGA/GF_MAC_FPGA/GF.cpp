#include<iostream>
#include<string>
#include<fstream>
#include<string>

using namespace std;

int main(){

	ifstream file_input_h0;
	ifstream file_input;
	ofstream file_output;
	file_input.open("AES_final0.txt");
	string r;
	int h0[4][4] = {};
	for (int i = 0; i < 4; i++){
		for (int j = 0; j < 4; j++){
			getline(file_input, r, '\n');
			h0[i][j] = atoi(r.c_str());
		}
	}

	/*for (int i = 0; i < 4; i++){
		for (int j = 0; j < 4; j++){
			
			cout << h0[i][j] << endl;
		}
	}*/
	file_input.close();


	int GF[4][4] = {};

	file_input.open("counter.txt");
	char temp1 = 0, temp2 = 0;
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
			GF[i][j] = temp1 * 16 + temp2;
		}
	}
	/*for (int i = 0; i < 4; i++){
	for (int j = 0; j < 4; j++){
	cout << GF[i][j] << endl;
	}
	}*/

	file_input.close();


	int ciphertext[4][4] = {};
	int GF1[8] = {};//state binary
	int GF2[16] = {};//GF binary
	//GF
	file_input.open("ciphertext_FPGA2.txt");

	for (int a = 0; a < 5; a++){
		for (int j = 0; j < 4; j++){
			for (int k = 0; k < 4; k++){

				int i = 0;
				int n = h0[j][k];
				//cout<<state[0][0]<<endl;
				for (int z = 0; z < 8; z++)
					GF1[z] = 0;
				while (n > 0)
				{
					GF1[i] = n % 2;
					n = n / 2;
					i++;
				}
				/*cout<<"GF1 "<<endl;
				for(int i=7;i>=0;i--)
				cout<<GF1[i];
				cout<<endl;*/
				int g_temp = GF[j][k];
				GF[j][k] = (g_temp*GF1[0]);
				for (int a = 1; a < 8; a++){
					int m = pow(2.0, a);
					GF[j][k] = GF[j][k] ^ (g_temp*GF1[a] * m);
					//cout<<"GF "<<GF[j][k]<<" a "<<a<<" m "<<m<<endl;
				}
				/*cout<<"counter"<<endl;
				for(int i=0;i<4;i++){
				for(int z=0;z<4;z++){
				cout<<counter[i][z]<<" ";
				}cout<<endl;
				}cout<<endl;*/

				/*cout<<"GF1"<<endl;
				for(int z=7;z>=0;z--)
				cout<<GF1[z];
				cout<<endl;*/

				/*cout<<"GF"<<endl;
				for(int i=0;i<4;i++){
				for(int z=0;z<4;z++){
				cout<<GF[i][z]<<" ";
				}cout<<endl;
				}*/

				i = 0;
				n = GF[j][k];
				while (n > 0)
				{
					GF2[i] = n % 2;
					n = n / 2;
					i++;
				}
				/*cout<<"GF2 ";
				for(i=15;i>=0;i--)

				cout<<GF2[i];
				cout<<endl;*/
				//cout<<GF[0][0];
				int g = GF[j][k];

				//while(GF2[7]==1 || GF2[8]==1 || GF2[9]==1 || GF2[10]==1 || GF2[11]==1|| GF2[12]==1|| GF2[13]==1|| GF2[14]==1|| GF2[15]==1){
				while (g >= 128){
					//cout<<"a"<<endl;
					if (GF2[7] == 1) g = g ^ 133;
					if (GF2[8] == 1) g = g ^ 266;
					if (GF2[9] == 1) g = g ^ 532;
					if (GF2[10] == 1) g = g ^ 1164;
					if (GF2[11] == 1) g = g ^ 2128;
					if (GF2[12] == 1) g = g ^ 4256;
					if (GF2[13] == 1) g = g ^ 8512;
					if (GF2[14] == 1) g = g ^ 17024;
					if (GF2[15] == 1) g = g ^ 34048;
					i = 0;

					n = g;
					//cout<<"n"<<n<<endl;
					for (int z = 0; z < 16; z++)
						GF2[z] = 0;
					while (n > 0)
					{
						GF2[i] = n % 2;
						n = n / 2;
						i++;
					}
					/*cout<<"GF2 ";
					for(i=15;i>=0;i--)
					cout<<GF2[i];
					cout<<endl;
					cout<<"g "<<g<<endl;*/
				}
				GF[j][k] = g;
			}
		}

		if (a == 0){
			file_output.open("GF_test2.txt");
			for (int i = 0; i < 4; i++){
				for (int j = 0; j < 4; j++){
					file_output << GF[i][j] << endl;
				}
			}
			file_output.close();
		}

		/*for (int i = 0; i < 4; i++){
			for (int j = 0; j < 4; j++){
			cout << GF[i][j] << endl;
			}
			}cout << endl;*/
		if (a != 4){

			for (int i = 0; i < 4; i++){
				for (int j = 0; j < 4; j++){
					file_input >> ciphertext[i][j];
				}
			}


			/*for (int i = 0; i < 4; i++){
				for (int j = 0; j < 4; j++){
				cout << ciphertext[i][j] << endl;
				}
				}cout << endl;*/

			for (int i = 0; i < 4; i++){
				for (int j = 0; j < 4; j++){
					GF[i][j] = ciphertext[i][j] ^ GF[i][j];
				}

			}

			/*for (int i = 0; i < 4; i++){
				for (int j = 0; j < 4; j++){
				cout << GF[i][j] << endl;
				}
				}cout << endl;*/

		}
		if (a == 3){
			file_output.open("GF_xor2.txt");
			for (int i = 0; i < 4; i++){
				for (int j = 0; j < 4; j++){
					file_output << GF[i][j] << endl;
				}
			}
			file_output.close();
		}
	}

	file_input.close();

	file_output.open("GF_final2.txt");
	for (int i = 0; i < 4; i++){
		for (int j = 0; j < 4; j++){
			file_output << GF[i][j] << endl;
		}
	}
	file_output.close();

	for (int i = 0; i < 4; i++){
		for (int j = 0; j < 4; j++){
			GF[i][j] = h0[i][j] ^ GF[i][j];
		}

	}

	char m,l;

	file_output.open("MAC_FPGA2.txt");
	for (int i = 0; i < 4; i++){
		for (int j = 0; j < 4; j++){

			if(GF[i][j]/16==10){
			  m='a';
			}
			else if(GF[i][j]/16==11){
			  m='b';
			}
			else if(GF[i][j]/16==12){
			  m='c';
			}
			else if(GF[i][j]/16==13){
			  m='d';
			}
			else if(GF[i][j]/16==14){
			  m='e';
			}
			else if(GF[i][j]/16==15){
			  m='f';
			}
			else {
			  m=GF[i][j]/16+'0';
			}

			if(GF[i][j]%16==10){
			  l='a';
			}
			else if(GF[i][j]%16==11){
			  l='b';
			}
			else if(GF[i][j]%16==12){
			  l='c';
			}
			else if(GF[i][j]%16==13){
			  l='d';
			}
			else if(GF[i][j]%16==14){
			  l='e';
			}
			else if(GF[i][j]%16==15){
			  l='f';
			}
			else {
			  l=GF[i][j]%16+'0';
			}

			file_output << m << l << endl;
		}
	}
	file_output.close();

	system("pause");
	return 0;
}