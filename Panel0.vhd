
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity Panel0 is
    Port (
        a_contenido : in std_logic;
        b_contenido : in std_logic;
        c_luz      : out std_logic;
        d_luz      : out std_logic;
        e_alarma   : out std_logic
    );
end Panel0;

architecture arch_panel0 of Panel0 is
    signal a_lleno, b_lleno : std_logic;
    signal a_vacio, b_vacio : std_logic;

begin
    -- Proceso para detectar si los silos están llenos o vacíos
    proceso_contenidos: process(a_contenido, b_contenido)
    begin
        if a_contenido = '1' then
            a_lleno <= '1';
            a_vacio <= '0';
        else
            a_lleno <= '0';
            a_vacio <= '1';
        end if;

        if b_contenido = '1' then
            b_lleno <= '1';
            b_vacio <= '0';
        else
            b_lleno <= '0';
            b_vacio <= '1';
        end if;
    end process proceso_contenidos;

    -- Proceso para controlar las luces y la alarma
    proceso_luces_alarma: process(a_lleno, b_lleno)
    begin
        if a_lleno = '1' and b_lleno = '1' then
            c_luz <= '0';
            d_luz <= '1';
            e_alarma <= '1';
        elsif a_lleno = '1' or b_lleno = '1' then
            c_luz <= '1';
            d_luz <= '0';
            e_alarma <= '0';
        else
            c_luz <= '0';
            d_luz <= '0';
            e_alarma <= '0';
        end if;
    end process proceso_luces_alarma;

end architecture arch_panel0;
