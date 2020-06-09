unsigned char readbuff[64] absolute 0x500;   // Buffers should be in USB RAM, please consult datasheet
unsigned char writebuff[64] absolute 0x540;
int oku=0;

void interrupt()
{
   USB_Interrupt_Proc();                   // USB servicing is done inside the interrupt
}

void main(void)
{
 ADC_Init();
 HID_Enable(&readbuff,&writebuff);       // Enable HID communication
  while(1)
  {
   oku=ADC_Read(0);
   if(oku>100) writebuff[0]='-';
   else writebuff[0]=' ';
    if(oku>200) writebuff[1]='-';
   else writebuff[1]=' ';
    if(oku>300) writebuff[2]='-';
   else writebuff[2]=' ';
    if(oku>400) writebuff[3]='-';
   else writebuff[3]=' ';
    if(oku>500) writebuff[4]='-';
   else writebuff[4]=' ';
    if(oku>600) writebuff[5]='-';
   else writebuff[5]=' ';
    if(oku>700) writebuff[6]='-';
   else writebuff[6]=' ';
    if(oku>800) writebuff[7]='-';
   else writebuff[7]=' ';
    if(oku>900) writebuff[8]='-';
   else writebuff[8]=' ';
    if(oku>1000) writebuff[9]='-';
   else writebuff[9]=' ';
      writebuff[10]=13;
      writebuff[11]=10;
   
   HID_Write(&writebuff,64);
   delay_ms(10);

  }
}