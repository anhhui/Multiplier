module halfadder(A,B,S,C
);
input A,B;
output S,C;
assign S = A ^ B;
assign C = A & B;
endmodule

module fulladder( A,B ,Ci,S,Co
    );
input A,B,Ci;
output Co,S;
wire I1,I2,I3;
halfadder HA1(A,B,I1,I2);
halfadder HA2(I1,Ci,S,I3);
assign Co = I2 || I3;
endmodule 

module WallaceTree16bit(A,B,prod
);
    
//inputs and outputs
    input [15:0] A,B;
    output [31:0] prod;
    //internal variables.
    wire s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,
			s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,
			s20,s21,s22,s23,s24,s25,s26,s27,s28,s29,
			s30,s31,s32,s33,s34,s35,s36,s37,s38,s39,
			s40,s41,s42,s43,s44,s45,s46,s47,s48,s49,
			s50,s51,s52,s53,s54,s55,s56,s57,s58,s59,
			s60,s61,s62,s63,s64,s65,s66,s67,s68,s69,
			s70,s71,s72,s73,s74,s75,s76,s77,s78,s79,
			s80,s81,s82,s83,s84,s85,s86,s87,s88,s89,
			s90,s91,s92,s93,s94,s95,s96,s97,s98,s99,
			s100,s101,s102,s103,s104,s105,s106,s107,s108,s109,
			s110,s111,s112,s113,s114,s115,s116,s117,s118,s119,
			s120,s121,s122,s123,s124,s125,s126,s127,s128,s129,
			s130,s131,s132,s133,s134,s135,s136,s137,s138,s139,
			s140,s141,s142,s143,s144,s145,s146,s147,s148,s149,
			s150,s151,s152,s153,s154,s155,s156,s157,s158,s159,
			s160,s161,s162,s163,s164,s165,s166,s167,s168,s169,
			s170,s171,s172,s173,s174,s175,s176,s177,s178,s179,
			s180,s181,s182,s183,s184,s185,s186,s187,s188,s189,
			s190,s191,s192,s193,s194,s195,s196,s197,s198,s199,
			s200,s201,s202,s203,s204,s205,s206,s207,s208,s209,
			s210,s211,s212,s213,s214,s215,s216,s217,s218,s219,
			s220,s221,s222,s223,s224,s225,s226,s227,s228,s229,
			s230,s231,s232,s233,s234,s235,s236,s237,s238,s239,
			s240,s241,s242,s243,s244,s245,s246,s247,s248,s249,
			s250,s251,s252,s253,s254,s255,s256,s257,s258,s259,
			s260,s261,s262,s263,s264,s265,s266,s267,s268,s269,
			s270,s271,s272,s273,s274,s275,s276,s277;
    wire c1,c2,c3,c4,c5,c6,c7,c8,c9,
			c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,
			c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,
			c30,c31,c32,c33,c34,c35,c36,c37,c38,c39,
			c40,c41,c42,c43,c44,c45,c46,c47,c48,c49,
			c50,c51,c52,c53,c54,c55,c56,c57,c58,c59,
			c60,c61,c62,c63,c64,c65,c66,c67,c68,c69,
			c70,c71,c72,c73,c74,c75,c76,c77,c78,c79,
			c80,c81,c82,c83,c84,c85,c86,c87,c88,c89,
			c90,c91,c92,c93,c94,c95,c96,c97,c98,c99,
			c100,c101,c102,c103,c104,c105,c106,c107,c108,c109,
			c110,c111,c112,c113,c114,c115,c116,c117,c118,c119,
			c120,c121,c122,c123,c124,c125,c126,c127,c128,c129,
			c130,c131,c132,c133,c134,c135,c136,c137,c138,c139,
			c140,c141,c142,c143,c144,c145,c146,c147,c148,c149,
			c150,c151,c152,c153,c154,c155,c156,c157,c158,c159,
			c160,c161,c162,c163,c164,c165,c166,c167,c168,c169,
			c170,c171,c172,c173,c174,c175,c176,c177,c178,c179,
			c180,c181,c182,c183,c184,c185,c186,c187,c188,c189,
			c190,c191,c192,c193,c194,c195,c196,c197,c198,c199,
			c200,c201,c202,c203,c204,c205,c206,c207,c208,c209,
			c210,c211,c212,c213,c214,c215,c216,c217,c218,c219,
			c220,c221,c222,c223,c224,c225,c226,c227,c228,c229,
			c230,c231,c232,c233,c234,c235,c236,c237,c238,c239,
			c240,c241,c242,c243,c244,c245,c246,c247,c248,c249,
			c250,c251,c252,c253,c254,c255,c256,c257,c258,c259,
			c260,c261,c262,c263,c264,c265,c266,c267,c268,c269,
			c270,c271,c272,c273,c274,c275,c276,c277;
    wire [15:0] p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15;

//initialize the p's.
    assign  p0 = A & {16{B[0]}};
    assign  p1 = A & {16{B[1]}};
    assign  p2 = A & {16{B[2]}};
    assign  p3 = A & {16{B[3]}};
	 assign  p4 = A & {16{B[4]}};
	 assign  p5 = A & {16{B[5]}};
	 assign  p6 = A & {16{B[6]}};
	 assign  p7 = A & {16{B[7]}};
	 assign  p8 = A & {16{B[8]}};
	 assign  p9 = A & {16{B[9]}};
	 assign  p10 = A & {16{B[10]}};
	 assign  p11 = A & {16{B[11]}};
	 assign  p12 = A & {16{B[12]}};
	 assign  p13 = A & {16{B[13]}};
	 assign  p14 = A & {16{B[14]}};
	 assign  p15 = A & {16{B[15]}};
	 

//final product assignments    
    assign prod[0] = p0[0];
    assign prod[1] = s1;
    assign prod[2] = s81;
    assign prod[3] = s131;
    assign prod[4] = s168;
    assign prod[5] = s204;
    assign prod[6] = s228;
    assign prod[7] = s253;
    assign prod[8] = s254;
	 assign prod[9] = s255;
	 assign prod[10] = s256;
	 assign prod[11] = s257;
	 assign prod[12] = s258;
	 assign prod[13] = s259;
	 assign prod[14] = s260;
	 assign prod[15] = s261;
	 assign prod[16] = s262;
	 assign prod[17] = s263;
	 assign prod[18] = s264;
	 assign prod[19] = s265;
	 assign prod[20] = s266;
	 assign prod[21] = s267;
	 assign prod[22] = s268;
	 assign prod[23] = s269;
	 assign prod[24] = s270;
	 assign prod[25] = s271;
	 assign prod[26] = s272;
	 assign prod[27] = s273;
	 assign prod[28] = s274;
	 assign prod[29] = s275;
	 assign prod[30] = s276;
	 assign prod[31] = s277;
	 


//first stage
    halfadder ha101(p0[1],p1[0],s1,c1);
    fulladder fa102(p0[2],p1[1],p2[0],s2,c2);
    fulladder fa103(p0[3],p1[2],p2[1],s3,c3);
    fulladder fa104(p0[4],p1[3],p2[2],s4,c4);
	 fulladder fa105(p0[5],p1[4],p2[3],s5,c5);
	 fulladder fa106(p0[6],p1[5],p2[4],s6,c6);
	 fulladder fa107(p0[7],p1[6],p2[5],s7,c7);
	 fulladder fa108(p0[8],p1[7],p2[6],s8,c8);
    fulladder fa109(p0[9],p1[8],p2[7],s9,c9);
    fulladder fa110(p0[10],p1[9],p2[8],s10,c10);
	 fulladder fa111(p0[11],p1[10],p2[9],s11,c11);
	 fulladder fa112(p0[12],p1[11],p2[10],s12,c12);
	 fulladder fa113(p0[13],p1[12],p2[11],s13,c13);
	 fulladder fa114(p0[14],p1[13],p2[12],s14,c14);
	 fulladder fa115(p0[15],p1[14],p2[13],s15,c15);
	 halfadder ha116(p1[15],p2[14],s16,c16);
	 
	 halfadder ha201(p3[1],p4[0],s17,c17);
    fulladder fa202(p3[2],p4[1],p5[0],s18,c18);
    fulladder fa203(p3[3],p4[2],p5[1],s19,c19);
    fulladder fa204(p3[4],p4[3],p5[2],s20,c20);
	 fulladder fa205(p3[5],p4[4],p5[3],s21,c21);
	 fulladder fa206(p3[6],p4[5],p5[4],s22,c22);
	 fulladder fa207(p3[7],p4[6],p5[5],s23,c23);
	 fulladder fa208(p3[8],p4[7],p5[6],s24,c24);
    fulladder fa209(p3[9],p4[8],p5[7],s25,c25);
    fulladder fa210(p3[10],p4[9],p5[8],s26,c26);
	 fulladder fa211(p3[11],p4[10],p5[9],s27,c27);
	 fulladder fa212(p3[12],p4[11],p5[10],s28,c28);
	 fulladder fa213(p3[13],p4[12],p5[11],s29,c29);
	 fulladder fa214(p3[14],p4[13],p5[12],s30,c30);
	 fulladder fa215(p3[15],p4[14],p5[13],s31,c31);
	 halfadder ha216(p4[15],p5[14],s32,c32);

    halfadder ha301(p6[1],p7[0],s33,c33);
    fulladder fa302(p6[2],p7[1],p8[0],s34,c34);
    fulladder fa303(p6[3],p7[2],p8[1],s35,c35);
    fulladder fa304(p6[4],p7[3],p8[2],s36,c36);
	 fulladder fa305(p6[5],p7[4],p8[3],s37,c37);
	 fulladder fa306(p6[6],p7[5],p8[4]   ,s38,c38);
	 fulladder fa307(p6[7],p7[6],p8[5]   ,s39,c39);
	 fulladder fa308(p6[8],p7[7],p8[6]   ,s40,c40);
    fulladder fa309(p6[9],p7[8],p8[7]   ,s41,c41);
    fulladder fa310(p6[10],p7[9],p8[8]  ,s42,c42);
	 fulladder fa311(p6[11],p7[10],p8[9] ,s43,c43);
	 fulladder fa312(p6[12],p7[11],p8[10],s44,c44);
	 fulladder fa313(p6[13],p7[12],p8[11],s45,c45);
	 fulladder fa314(p6[14],p7[13],p8[12],s46,c46);
	 fulladder fa315(p6[15],p7[14],p8[13],s47,c47);
	 halfadder ha316(p7[15],p8[14]       ,s48,c48);

    halfadder ha401(p9[1],p10[0]          ,s49,c49);
    fulladder fa402(p9[2],p10[1],p11[0]   ,s50,c50);
    fulladder fa403(p9[3],p10[2],p11[1]   ,s51,c51);
    fulladder fa404(p9[4],p10[3],p11[2]   ,s52,c52);
	 fulladder fa405(p9[5],p10[4],p11[3]   ,s53,c53);
	 fulladder fa406(p9[6],p10[5],p11[4]   ,s54,c54);
	 fulladder fa407(p9[7],p10[6],p11[5]   ,s55,c55);
	 fulladder fa408(p9[8],p10[7],p11[6]   ,s56,c56);
    fulladder fa409(p9[9],p10[8],p11[7]   ,s57,c57);
    fulladder fa410(p9[10],p10[9],p11[8]  ,s58,c58);
	 fulladder fa411(p9[11],p10[10],p11[9] ,s59,c59);
	 fulladder fa412(p9[12],p10[11],p11[10],s60,c60);
	 fulladder fa413(p9[13],p10[12],p11[11],s61,c61);
	 fulladder fa414(p9[14],p10[13],p11[12],s62,c62);
	 fulladder fa415(p9[15],p10[14],p11[13],s63,c63);
	 halfadder ha416(p10[15],p11[14]       ,s64,c64);
	 
    halfadder ha501(p12[1],p13[0]          ,s65,c65);
    fulladder fa502(p12[2],p13[1],p14[0]   ,s66,c66);
    fulladder fa503(p12[3],p13[2],p14[1]   ,s67,c67);
    fulladder fa504(p12[4],p13[3],p14[2]   ,s68,c68);
	 fulladder fa505(p12[5],p13[4],p14[3]   ,s69,c69);
	 fulladder fa506(p12[6],p13[5],p14[4]   ,s70,c70);
	 fulladder fa507(p12[7],p13[6],p14[5]   ,s71,c71);
	 fulladder fa508(p12[8],p13[7],p14[6]   ,s72,c72);
    fulladder fa509(p12[9],p13[8],p14[7]   ,s73,c73);
    fulladder fa510(p12[10],p13[9],p14[8]  ,s74,c74);
	 fulladder fa511(p12[11],p13[10],p14[9] ,s75,c75);
	 fulladder fa512(p12[12],p13[11],p14[10],s76,c76);
	 fulladder fa513(p12[13],p13[12],p14[11],s77,c77);
	 fulladder fa514(p12[14],p13[13],p14[12],s78,c78);
	 fulladder fa515(p12[15],p13[14],p14[13],s79,c79);
	 halfadder ha516(p13[15],p14[14]        ,s80,c80);

//second stage
    halfadder ha601(c1 ,s2        ,s81,c81);
    fulladder fa602(c2 ,s3,p3[0]  ,s82,c82);
    fulladder fa603(c3 ,s4,s17    ,s83,c83);
    fulladder fa604(c4 ,s5,s18    ,s84,c84);
    fulladder fa605(c5 ,s6,s19    ,s85,c85);
	 fulladder fa606(c6 ,s7,s20    ,s86,c86);
	 fulladder fa607(c7 ,s8,s21    ,s87,c87);
	 fulladder fa608(c8 ,s9,s22    ,s88,c88);
	 fulladder fa609(c9 ,s10,s23   ,s89,c89);
    fulladder fa610(c10,s11,s24   ,s90,c90);
    fulladder fa611(c11,s12,s25   ,s91,c91);
	 fulladder fa612(c12,s13,s26   ,s92,c92);
	 fulladder fa613(c13,s14,s27   ,s93,c93);
	 fulladder fa614(c14,s15,s28   ,s94,c94);
	 fulladder fa615(c15,s16,s29   ,s95,c95);
	 fulladder fa616(c16,p2[15],s30,s96,c96);

    halfadder ha701(p6[0],c18  ,s97,c97);
    halfadder ha702(c19    ,s33,s98,c98);
    fulladder fa703(c20,c33,s34,s99,c99);
    fulladder fa704(c21,c34,s35,s100,c100);
    fulladder fa705(c22,c35,s36,s101,c101);
	 fulladder fa706(c23,c36,s37,s102,c102);
	 fulladder fa707(c24,c37,s38,s103,c103);
	 fulladder fa708(c25,c38,s39,s104,c104);
	 fulladder fa709(c26,c39,s40,s105,c105);
    fulladder fa710(c27,c40,s41,s106,c106);
    fulladder fa711(c28,c41,s42,s107,c107);
	 fulladder fa712(c29,c42,s43,s108,c108);
	 fulladder fa713(c30,c43,s44,s109,c109);
	 fulladder fa714(c31,c44,s45,s110,c110);
	 fulladder fa715(c32,c45,s46,s111,c111);
	 halfadder ha716(    c46,s47,s112,c112);
	 halfadder ha717(    c47,s48,s113,c113);
	 halfadder ha718(p8[15] ,c48,s114,c114);
	 
    halfadder ha801(c49,s50        ,s115,c115);
    fulladder fa802(c50,s51,p12[0] ,s116,c116);
    fulladder fa803(c51,s52,s65    ,s117,c117);
    fulladder fa804(c52,s53,s66    ,s118,c118);
    fulladder fa805(c53,s54,s67    ,s119,c119);
	 fulladder fa806(c54,s55,s68    ,s120,c120);
	 fulladder fa807(c55,s56,s69    ,s121,c121);
	 fulladder fa808(c56,s57,s70    ,s122,c122);
	 fulladder fa809(c57,s58,s71    ,s123,c123);
    fulladder fa810(c58,s59,s72    ,s124,c124);
    fulladder fa811(c59,s60,s73    ,s125,c125);
	 fulladder fa812(c60,s61,s74    ,s126,c126);
	 fulladder fa813(c61,s62,s75    ,s127,c127);
	 fulladder fa814(c62,s63,s76    ,s128,c128);
	 fulladder fa815(c63,s64,s77    ,s129,c129);
	 fulladder fa816(c64,p11[15],s78,s130,c130);
	 
//third stage
    halfadder ha901(c81,s82    ,s131,c131);
    halfadder ha902(c82,s83    ,s132,c132);
    fulladder fa903(c83,s84,c17,s133,c133);
    fulladder fa904(c84,s85,s97,s134,c134);
    fulladder fa905(c85,s86,s98,s135,c135);
	 fulladder fa906(c86,s87,s99,s136,c136);
	 fulladder fa907(c87,s88,s100,s137,c137);
	 fulladder fa908(c88,s89,s101,s138,c138);
	 fulladder fa909(c89,s90,s102,s139,c139);
    fulladder fa910(c90,s91,s103,s140,c140);
    fulladder fa911(c91,s92,s104,s141,c141);
	 fulladder fa912(c92,s93,s105,s142,c142);
	 fulladder fa913(c93,s94,s106,s143,c143);
	 fulladder fa914(c94,s95,s107,s144,c144);
	 fulladder fa915(c95,s96,s108,s145,c145);
	 fulladder fa916(c96,s31,s109,s146,c146);
	 halfadder ha917(s110,s32    ,s147,c147);
	 halfadder ha918(s111,p5[15] ,s148,c148);

    halfadder ha1001(p9[0],c99    ,s149,c149);
    halfadder ha1002(s49, c100     ,s150,c150);
    halfadder ha1003(s115,c101     ,s151,c151);
    fulladder fa1004(c115,c102,s116,s152,c152);
    fulladder fa1005(c116,c103,s117,s153,c153);
	 fulladder fa1006(c117,c104,s118,s154,c154);
	 fulladder fa1007(c118,c105,s119,s155,c155);
	 fulladder fa1008(c119,c106,s120,s156,c156);
	 fulladder fa1009(c120,c107,s121,s157,c157);
    fulladder fa1010(c121,c108,s122,s158,c158);
    fulladder fa1011(c122,c109,s123,s159,c159);
	 fulladder fa1012(c123,c110,s124,s160,c160);
	 fulladder fa1013(c124,c111,s125,s161,c161);
	 fulladder fa1014(c125,c112,s126,s162,c162);
	 fulladder fa1015(c126,c113,s127,s163,c163);
	 fulladder fa1016(c127,c114,s128,s164,c164);
	 halfadder ha1017(c128,     s129,s165,c165);
	 halfadder ha1018(c129,     s130,s166,c166);
	 halfadder ha1019(c130,      s79,s167,c167);

//fourth stage

    halfadder ha1101(c131,s132     ,s168,c168);
    halfadder ha1102(c132,s133     ,s169,c169);
    halfadder ha1103(c133,s134     ,s170,c170);
    fulladder fa1104(c134,s135, c97,s171,c171);
    fulladder fa1105(c135,s136, c98,s172,c172);
	 fulladder fa1106(c136,s137,s149,s173,c173);
	 fulladder fa1107(c137,s138,s150,s174,c174);
	 fulladder fa1108(c138,s139,s151,s175,c175);
	 fulladder fa1109(c139,s140,s152,s176,c176);
    fulladder fa1110(c140,s141,s153,s177,c177);
    fulladder fa1111(c141,s142,s154,s178,c178);
	 fulladder fa1112(c142,s143,s155,s179,c179);
	 fulladder fa1113(c143,s144,s156,s180,c180);
	 fulladder fa1114(c144,s145,s157,s181,c181);
	 fulladder fa1115(c145,s146,s158,s182,c182);
	 fulladder fa1116(c146,s147,s159,s183,c183);
	 fulladder fa1117(c147,s148,s160,s184,c184);
	 fulladder fa1118(c148,s112,s161,s185,c185);
	 halfadder ha1119(     s113,s162,s186,c186);
	 halfadder ha1120(     s114,s163,s187,c187);

    halfadder ha1201(c153,c65          ,s188,c188);
    fulladder fa1202(c154,c66   ,p15[0],s189,c189);
    fulladder fa1203(c155,c67   ,p15[1],s190,c190);
    fulladder fa1204(c156,c68   ,p15[2],s191,c191);
	 fulladder fa1205(c157,c69   ,p15[3],s192,c192);
	 fulladder fa1206(c158,c70   ,p15[4],s193,c193);
	 fulladder fa1207(c159,c71   ,p15[5],s194,c194);
	 fulladder fa1208(c160,c72   ,p15[6],s195,c195);
    fulladder fa1209(c161,c73   ,p15[7],s196,c196);
    fulladder fa1210(c162,c74   ,p15[8],s197,c197);
	 fulladder fa1211(c163,c75   ,p15[9],s198,c198);
	 fulladder fa1212(c164,c76   ,p15[10],s199,c199);
	 fulladder fa1213(c165,c77   ,p15[11],s200,c200);
	 fulladder fa1214(c166,c78   ,p15[12],s201,c201);
	 fulladder fa1215(c167,c79   ,p15[13],s202,c202);
	 fulladder fa1216(p14[15],c80,p15[14],s203,c203);

//fifth stage

    halfadder ha1301(c168,s169     ,s204,c204);
	 halfadder ha1302(c169,s170     ,s205,c205);
	 halfadder ha1303(c170,s171     ,s206,c206);
	 halfadder ha1304(c171,s172     ,s207,c207);
	 halfadder ha1305(c172,s173     ,s208,c208);
    fulladder fa1306(c173,s174,c149,s209,c209);
    fulladder fa1307(c174,s175,c150,s210,c210);
    fulladder fa1308(c175,s176,c151,s211,c211);
	 fulladder fa1309(c176,s177,c152,s212,c212);
	 fulladder fa1310(c177,s178,s188,s213,c213);
	 fulladder fa1311(c178,s179,s189,s214,c214);
	 fulladder fa1312(c179,s180,s190,s215,c215);
    fulladder fa1313(c180,s181,s191,s216,c216);
    fulladder fa1314(c181,s182,s192,s217,c217);
	 fulladder fa1315(c182,s183,s193,s218,c218);
	 fulladder fa1316(c183,s184,s194,s219,c219);
	 fulladder fa1317(c184,s185,s195,s220,c220);
	 fulladder fa1318(c185,s186,s196,s221,c221);
	 fulladder fa1319(c186,s187,s197,s222,c222);
	 fulladder fa1320(s164,c187,s198,s223,c223);
	 halfadder ha1321(s165		,s199,s224,c224);
	 halfadder ha1322(s166		,s200,s225,c225);
	 halfadder ha1323(s167		,s201,s226,c226);
	 halfadder ha1324(s80 		,s202,s227,c227);
	 
//sixth stage

    halfadder ha1401(c204,s205     ,s228,c228);
	 halfadder ha1402(c205,s206     ,s229,c229);
	 halfadder ha1403(c206,s207     ,s230,c230);
	 halfadder ha1404(c207,s208     ,s231,c231);
	 halfadder ha1405(c208,s209     ,s232,c232);
    halfadder ha1406(c209,s210     ,s233,c233);
    halfadder ha1407(c210,s211     ,s234,c234);
    halfadder ha1408(c211,s212     ,s235,c235);
	 halfadder ha1409(c212,s213     ,s236,c236);
	 fulladder fa1410(c213,s214,c188,s237,c237);
	 fulladder fa1411(c214,s215,c189,s238,c238);
	 fulladder fa1412(c215,s216,c190,s239,c239);
    fulladder fa1413(c216,s217,c191,s240,c240);
    fulladder fa1414(c217,s218,c192,s241,c241);
	 fulladder fa1415(c218,s219,c193,s242,c242);
	 fulladder fa1416(c219,s220,c194,s243,c243);
	 fulladder fa1417(c220,s221,c195,s244,c244);
	 fulladder fa1418(c221,s222,c196,s245,c245);
	 fulladder fa1419(c222,s223,c197,s246,c246);
	 fulladder fa1420(c223,s224,c198,s247,c247);
	 fulladder fa1421(c224,s225,c199,s248,c248);
	 fulladder ha1422(c225,s226,c200,s249,c249);
	 fulladder ha1423(c226,s227,c201,s250,c250);
	 fulladder ha1424(c227,s203,c202,s251,c251);
	 halfadder ha1425(c203,	p15[15] ,s252,c252);	 
	 
//seventh stage

    halfadder ha1501(c228,s229     ,s253,c253);
	 fulladder fa1502(c229,s230,c253,s254,c254);
	 fulladder fa1503(c230,s231,c254,s255,c255);
	 fulladder fa1504(c231,s232,c255,s256,c256);
	 fulladder fa1505(c232,s233,c256,s257,c257);
    fulladder fa1506(c233,s234,c257,s258,c258);
    fulladder fa1507(c234,s235,c258,s259,c259);
    fulladder fa1508(c235,s236,c259,s260,c260);
	 fulladder fa1509(c236,s237,c260,s261,c261);
	 fulladder fa1510(c237,s238,c261,s262,c262);
	 fulladder fa1511(c238,s239,c262,s263,c263);
	 fulladder fa1512(c239,s240,c263,s264,c264);
    fulladder fa1513(c240,s241,c264,s265,c265);
    fulladder fa1514(c241,s242,c265,s266,c266);
	 fulladder fa1515(c242,s243,c266,s267,c267);
	 fulladder fa1516(c243,s244,c267,s268,c268);
	 fulladder fa1517(c244,s245,c268,s269,c269);
	 fulladder fa1518(c245,s246,c269,s270,c270);
	 fulladder fa1519(c246,s247,c270,s271,c271);
	 fulladder fa1520(c247,s248,c271,s272,c272);
	 fulladder fa1521(c248,s249,c272,s273,c273);
	 fulladder ha1522(c249,s250,c273,s274,c274);
	 fulladder ha1523(c250,s251,c274,s275,c275);
	 fulladder ha1524(c251,s252,c275,s276,c276);
	 halfadder ha1525(c252,c276,s277,c277);	 
endmodule
