SECTIONS
{
	. = 0x8000;
	__stack_start = .;
	
	.init :
	{
		*(.init.text*);
	}

	.text :
	{
		__text_start	= .;
		*(.text*);
		__text_end	= .;
	}
	
	.data :
	{
		__data_start	= .;
		*(.data*);
		__data_end	= .;
	}
	
	.bss :
	{
		__bss_start	= .;
		*(.bss*)
		__bss_end	= .;
	}
}

