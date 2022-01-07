import sys

hex_to_dec = {
    "0" : 0,
    "1" : 1,
    "2" : 2,
    "3" : 3,
    "4" : 4,
    "5" : 5,
    "6" : 6,
    "7" : 7,
    "8" : 8,
    "9" : 9,
    "A" : 10,
    "B" : 11,
    "C" : 12,
    "D" : 13,
    "E" : 14,
    "F" : 15
}

dec_to_hex = {
    0 : "0",
    1 : "1",
    2 : "2",
    3 : "3",
    4 : "4",
    5 : "5",
    6 : "6",
    7 : "7",
    8 : "8",
    9 : "9",
    10 : "A",
    11 : "B",
    12 : "C",
    13 : "D",
    14 : "E",
    15 : "F"
}

def main() :
    bytes = [];

    with open(sys.argv[1], 'r') as hex_file :
        for line in hex_file :
            bytes_number = 16*hex_to_dec[line[1]] + hex_to_dec[line[2]]
            offset = 9
            test = []
            for i in range(bytes_number) :
                bytes.append(line[offset+(2*i):offset+(2*i)+2])

    with open(sys.argv[2], 'w') as mif_file :
        mif_file.write("WIDTH=32;\n")
        mif_file.write("DEPTH=512;\n")
        mif_file.write("ADDRESS_RADIX=HEX;\n")
        mif_file.write("DATA_RADIX=HEX;\n")
        mif_file.write(" \n")
        mif_file.write("CONTENT BEGIN\n")
        mif_file.write(" \n")

        current_address = "000"
        while len(bytes) != 0 :
            element_32_bits = ""
            while (len(bytes) != 0) and (len(element_32_bits) < 8) :
                element_32_bits = bytes[0] + element_32_bits
                bytes.pop(0)
            while len(element_32_bits) < 8 :
                element_32_bits = "00" + element_32_bits
            mif_file.write(current_address + " : " + element_32_bits + ";\n")
            address_elements_dec = [hex_to_dec[current_address[i]]  for i in range(3)]
            address_dec = address_elements_dec[2] + address_elements_dec[1]*16 + address_elements_dec[0]*16*16
            address_dec+=1
            address_elements = [dec_to_hex[address_dec//(16*16)], dec_to_hex[(address_dec-(address_dec//(16*16)))//(16)], dec_to_hex[address_dec%16]]
            current_address = address_elements[0] + address_elements[1] + address_elements[2];

        mif_file.write(" \n")
        mif_file.write("[" + current_address + "..1FF] : 00000000;\n")
        mif_file.write(" \n")
        mif_file.write("END;\n")


if __name__ == "__main__" :
    if len(sys.argv) != 3 :
        print("usage : python mif_converter input.hex output.mif")
    else :
        main()
