#!/bin/bash


menu(){

	OPERATION=$(
	yad --form\
		--title="Menu de Seleção"\
		--width=400\
		--height=200\
		--field="Escolha a Operação:":CB Instalar!Converter\
		--buton=gtk-ok:0\
		--center)

		if [ $? -ne 1 ]
		then 
			case $OPERATION in

				'Instalar|')
					INSTALL=$(
					yad --form\
						--title="Instalação de Pacote .deb"\
						--width=400\
						--height=200\
						--field="Arquivo":FL""\
						--center)
					if [ $? -eq 0 ]
					then
						ARQI=$(echo "${INSTALL}" | cut -d"|" -f1)
						if [ $? -eq 0 ]
						then
							sudo dpkg -i $ARQI
						fi
					fi

					
				;;

				'Converter|')
					CONVERT=$(
					yad --form\
						--title="Conversão de Pacote .rpm"\
						--width=400\
						--height=200\
						--field="Arquivo":FL""\
						--center)
					if [ $? -eq 0 ]
					then
						ARQR=$(echo ${CONVERT} | cut -d"|" -f1)
						if [ $? -eq 0 ]
						then
							sudo alien ${ARQR}
						fi
					fi

					
				;;

			esac
		else
			exit;
		fi
}


while [[ true ]]; do
	menu;
done