CC	= arm-none-eabi-gcc
LD	= arm-none-eabi-gcc
OBJCOPY	= arm-none-eabi-objcopy
OBJDUMP	= arm-none-eabi-objdump
NM	= arm-none-eabi-nm
RM	= rm -rf

C_FLAGS	= -O2 -mcpu=arm1176jzf-s -ffreestanding -nostdlib

OUTFILE	= kernel.img
S_FILES	= start.S
C_FILES	= first.c
LD_FILE	= rpi0.ld

O_FILES = $(S_FILES:.S=.o) $(C_FILES:.c=.o)

%.o: %.S
	$(CC) $(C_FLAGS) -c $< -o $@

%.o: %.c
	$(CC) $(C_FLAGS) -c $< -o $@

$(OUTFILE): $(O_FILES)
	$(LD) $(C_FLAGS) -T $(LD_FILE) $^ -o $(@:.img=.elf)
	$(NM) $(@:.img=.elf) > $(@:.img=.lst)
	$(OBJDUMP) -d $(@:.img=.elf) > $(@:.img=.lss)
	$(OBJCOPY) -O binary $(@:.img=.elf) $@

clean:
	$(RM) *.o *.elf *.lss *.lst $(OUTFILE)

.PHONY:	clean

