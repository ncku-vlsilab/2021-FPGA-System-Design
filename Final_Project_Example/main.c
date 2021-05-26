/*
 * main.c
 *
 *  Created on: 2019?1?10?
 *      Author: USER
 */



#include <stdio.h>
//#include "xil_printf.h"
#include "xil_io.h"
#include "xparameters.h"


void	write_data(u32 address, u32 data);
u32 read_data(u32 address);

int main()
{
	u32	data=0;
	u32 done=0;
	u32 done2=0;
	u32 mem;

    print("Program start\n\r");



    //64 bytes plaintext

    write_data(0x00000000, 0x00000001);
    write_data(0x00000001, 0x00000203);
    write_data(0x00000002, 0x00000405);
    write_data(0x00000003, 0x00000607);
    write_data(0x00000004, 0x00000809);
    write_data(0x00000005, 0x00000a0b);
    write_data(0x00000006, 0x00000c0d);
    write_data(0x00000007, 0x00000e0f);
    write_data(0x00000008, 0x00001011);
    write_data(0x00000009, 0x00001213);
    write_data(0x0000000a, 0x00001415);
    write_data(0x0000000b, 0x00001617);
    write_data(0x0000000c, 0x00001819);
    write_data(0x0000000d, 0x00001a1b);
    write_data(0x0000000e, 0x00001c1d);
    write_data(0x0000000f, 0x00001e1f);
    write_data(0x00000010, 0x00002021);
    write_data(0x00000011, 0x00002223);
    write_data(0x00000012, 0x00002425);
    write_data(0x00000013, 0x00002627);
    write_data(0x00000014, 0x00002829);
    write_data(0x00000015, 0x00002a2b);
    write_data(0x00000016, 0x00002c2d);
    write_data(0x00000017, 0x00002e2f);
    write_data(0x00000018, 0x00003031);
    write_data(0x00000019, 0x00003233);
    write_data(0x0000001a, 0x00003435);
    write_data(0x0000001b, 0x00003637);
    write_data(0x0000001c, 0x00003839);
    write_data(0x0000001d, 0x00003a3b);
    write_data(0x0000001e, 0x00003c3d);
    write_data(0x0000001f, 0x00003e3f);


    	/*write_data(0x00000000, 0x00000001);
        write_data(0x00000001, 0x00000002);
        write_data(0x00000002, 0x00000003);
        write_data(0x00000003, 0x00000004);
        write_data(0x00000004, 0x00000005);
        write_data(0x00000005, 0x00000006);
        write_data(0x00000006, 0x00000007);
        write_data(0x00000007, 0x00000008);
        write_data(0x00000008, 0x00000009);
        write_data(0x00000009, 0x0000000a);
        write_data(0x0000000a, 0x0000000b);
        write_data(0x0000000b, 0x0000000c);
        write_data(0x0000000c, 0x0000000d);
        write_data(0x0000000d, 0x0000000e);
        write_data(0x0000000e, 0x0000000f);
        write_data(0x0000000f, 0x00001110);
        write_data(0x00000010, 0x00001111);
        write_data(0x00000011, 0x00001112);
        write_data(0x00000012, 0x00001113);
        write_data(0x00000013, 0x00001114);
        write_data(0x00000014, 0x00001115);
        write_data(0x00000015, 0x00001116);
        write_data(0x00000016, 0x00001117);
        write_data(0x00000017, 0x00001118);
        write_data(0x00000018, 0x00001119);
        write_data(0x00000019, 0x0000111a);
        write_data(0x0000001a, 0x0000111b);
        write_data(0x0000001b, 0x0000111c);
        write_data(0x0000001c, 0x0000111d);
        write_data(0x0000001d, 0x0000111e);
        write_data(0x0000001e, 0x0000111f);
        write_data(0x0000001f, 0x00000000);*/

    /*for(int i=0;i<6000000;i++){
    	;
    }*/

    while(done==0){
    	done = Xil_In32(XPAR_TOP_MERGE_0_S00_AXI_BASEADDR);
    }


    printf("after encrypt:\n\r");

    for(int j=0;j<41;j++){
    	if(j!=32){
    	data = read_data(0+j);
    	printf("ADDR : %d, Data = %x\n\r", j,data);
    	}
    	else {
    		printf("MAC:\n\r");
    	}
    }

    while(done2==0){
        	done2 = Xil_In32(XPAR_TOP_MERGE_0_S00_AXI_BASEADDR+4);
        }

    printf("after decrypt:\n\r");

        for(int j=0;j<40;j++){
        	if(j!=32){
        	data = read_data(0+j);
        	printf("ADDR : %d, Data = %x\n\r", j,data);
        	}
        	else {
        		printf("MAC:\n\r");
        		data = read_data(0+j);
        		printf("ADDR : %d, Data = %x\n\r", j,data);

        	}
        }



/*
    data = read_data(0x00000001);
    printf("ADDR : 0, Data = %x\n\r", data);
    data = read_data(0x00000001);
        printf("ADDR : 0, Data = %x\n\r", data);
        data = read_data(0x00000001);
            printf("ADDR : 0, Data = %x\n\r", data);
            data = read_data(0x00000001);
                printf("ADDR : 0, Data = %x\n\r", data);
                data = read_data(0x00000001);
                    printf("ADDR : 0, Data = %x\n\r", data);*/
    /*for(int i=0;i<6000000;i++){
    done = Xil_In32(XPAR_TOP_0_S00_AXI_BASEADDR);
    }*/

    /*done = Xil_In32(XPAR_TOP_0_S00_AXI_BASEADDR);
    printf("done = %x\n\r", done);*/

    //data = read_data(0x00000000);
    //printf("ADDR : 0, Data = %x\n\r", data);

   // data = read_data(0x00000001);
    //printf("ADDR : 1, Data = %x\n\r", data);



    return 0;
}

void	write_data(u32 address, u32 data)
{
	u32 ans;

    Xil_Out32(XPAR_MEMORY_CTRL_MERGE_0_S00_AXI_BASEADDR + 0x00000004, 0x00000002);	//cmd	write
    Xil_Out32(XPAR_MEMORY_CTRL_MERGE_0_S00_AXI_BASEADDR + 0x00000008, data);			//data_in
    Xil_Out32(XPAR_MEMORY_CTRL_MERGE_0_S00_AXI_BASEADDR + 0x0000000C, address);		//address
    Xil_Out32(XPAR_MEMORY_CTRL_MERGE_0_S00_AXI_BASEADDR, 0x00000001);					//cmd valid
    Xil_Out32(XPAR_MEMORY_CTRL_MERGE_0_S00_AXI_BASEADDR, 0x00000000);					//cmd no valid
    ans = 0x00000000;
    while(ans != 0x00000001)
    {
    	ans = Xil_In32(XPAR_MEMORY_CTRL_MERGE_0_S00_AXI_BASEADDR);					//waiting for cmd done
    }
}

u32 read_data(u32 address)
{
	u32 ans;
	u32 data;

    Xil_Out32(XPAR_MEMORY_CTRL_MERGE_0_S00_AXI_BASEADDR + 0x00000004, 0x00000001);	//cmd	read
    Xil_Out32(XPAR_MEMORY_CTRL_MERGE_0_S00_AXI_BASEADDR + 0x0000000C, address);		//address
    Xil_Out32(XPAR_MEMORY_CTRL_MERGE_0_S00_AXI_BASEADDR, 0x00000001);					//cmd valid
    Xil_Out32(XPAR_MEMORY_CTRL_MERGE_0_S00_AXI_BASEADDR, 0x00000000);					//cmd no valid
    ans = 0x00000000;
    while(ans != 0x00000001)
    {
    	ans = Xil_In32(XPAR_MEMORY_CTRL_MERGE_0_S00_AXI_BASEADDR);					//waiting for cmd done
    }
    data = Xil_In32(XPAR_MEMORY_CTRL_MERGE_0_S00_AXI_BASEADDR + 0x00000004);			//data_out
    return data;
}
