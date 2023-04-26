-- LIBRARY IEEE;
-- USE IEEE.std_logic_1164.ALL;
-- USE IEEE.std_logiC_unsigned;
-- ENTITY cnt10 IS
--     PORT (
--         CLK, RST, EN : IN STD_LOGIC;
--         CQ : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
--         COUT : IN STD_LOGIC
--     );
-- END cnt10;
-- ARCHITECTURE behav OF cnt10 IS
--     PROCESS (CLK, RST, EN)
--         VARIABLE CQI : STD_LOGIC_VECTOR(3 DOWNTO 0);
--         VARIABLE CO : STD_LOGIC;

--     BEGIN
--         IF RST = '0' THEN
--             CQI := (OTHERS => '0'); --
--         ELSIF CLK'event AND CLK = '1' THEN
--             IF EN = '1' THEN
--                 IF CQI < 9 THEN
--                     CQI := CQI + 1;
--                 ELSE
--                     CQI := (OTHERS => '0');
--                 END IF;
--             END IF;
--         END IF;
--         IF CQI = '9' THEN
--             CO := '1';
--         ELSE
--             CO := '0';
--         END IF;
--         CQ <= NOT CQI;
--         COUT <= NOT CO;
--     END PROCESS;
-- END behav;
注释如下：

LIBRARY IEEE; -- 引用 IEEE 库
USE IEEE.std_logic_1164.ALL; -- 引用标准逻辑库
USE IEEE.std_logiC_unsigned; -- 引用标准无符号库
ENTITY cnt10 IS -- 定义实体，名称为 cnt10
    PORT (-- 端口列表
        CLK, RST, EN : IN STD_LOGIC; -- 输入时钟 CLK、复位信号 RST、使能信号 EN
        CQ : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); -- 输出计数器的值 CQ，为 4 位二进制数
        COUT : IN STD_LOGIC -- 输入进位输出 COUT
    );
END cnt10;
ARCHITECTURE behav OF cnt10 IS -- 定义行为结构体架构，名称为 behav，作用于实体 cnt10
    PROCESS (CLK, RST, EN) -- 进程
        VARIABLE CQI : STD_LOGIC_VECTOR(3 DOWNTO 0); -- 声明变量 CQI，作用于计数器的值，为 4 位二进制数
        VARIABLE CO : STD_LOGIC; -- 声明变量 CO，作用于进位输出信号

    BEGIN
        IF RST = '0' THEN -- 如果复位信号为低电平，则计数器的值被清零
            CQI := (OTHERS => '0'); -- CQI 的所有位都被初始化为 0
        ELSIF CLK'event AND CLK = '1' THEN -- 如果时钟为上升沿
            IF EN = '1' THEN -- 如果使能信号为高电平
                IF CQI < 9 THEN -- 如果计数器的值小于 9
                    CQI := CQI + 1; -- 计数器的值加 1
                ELSE -- 否则
                    CQI := (OTHERS => '0'); -- 计数器的值被清零
                END IF;
            END IF;
        END IF;
        IF CQI = '9' THEN -- 如果计数器的值为 9
            CO := '1'; -- 进位输出信号为高电平
        ELSE -- 否则
            CO := '0'; -- 进位输出信号为低电平
        END IF;
        CQ <= NOT CQI; -- 计数器的值取反输出
        COUT <= NOT CO; -- 进位输出信号取反输出 COUT  变成了一个“借位”信号，用于表明下一位是否需要加  1
    END PROCESS;
END behav; -- 结束行为结构体架构定义
-- 在数字电路中，一些设计中通过将信号取反来实现某些特定的功能。具体到这段代码中，取反输出主要有以下两个原因：

-- 1. 确定计数器是否溢出：

-- 取反后的 CQ 可以用于判断计数器是否溢出。在常规情况下，CQI 表示计数器的当前值，而 CQ 则表示计数器的补码。当计数器增加到最大值后，CQI 的值为计数器所有位均为 1，而 CQ 的值则为 0。因此，通过判断 CQ 的值是否为 0，可以确定计数器是否溢出。

-- 2. 确定下一位是否需要加 1：

-- 取反后的 COUT 则用于确定下一位是否需要加 1。在常规情况下，COUT 表示上一位计数器的“进位”信号。当某一位计数器的值增加到最大值后，需要进位到下一位，此时 COUT 的值为 1。而当这一位计数器的值为 0 时，不需要进位，COUT 的值为 0。因此，通过取反后的 COUT，可以确定下一位是否需要加 1。

-- 因此，这段代码中需要取反输出，是因为取反后的信号可以用于进一步确定计数器的状态，从而实现计数器的功能。