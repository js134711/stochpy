Species_In_Conc: True
Output_In_Conc: True

UnitTime: second, 60, 0, 1
UnitSubstance: mole, 1, -9, 1


T1R_formation:
    $pool > t1r_surf
    v_tir

seques_calveolar_t1r:
    t1r_surf = t1r_cave
    ki_cave*t1r_surf - kr_cave*t1r_cave

seques_endo_t1r: 
    t1r_surf = t1r_ee
    ki_ee*t1r_surf - kr_ee*t1r_ee

T2R_formation:
    $pool > t2r_surf
    v_t2r

seques_calveolar_t2r:
    t2r_surf = t2r_cave
    ki_cave*t2r_surf - kr_cave*t2r_cave

seques_endo_t2r: 
    t2r_surf = t2r_ee
    ki_ee*t2r_surf - kr_ee*t2r_ee

deg_endo_t2r: 
    t2r_ee > $pool
    kdeg_t2r*t2r_ee

deg_endo_t1r:
    t1r_ee > $pool
    kdeg_t1r*t1r_ee

LRC_formation: 
    t1r_surf + t2r_surf + tgf_beta > lrc_surf
    k_lrc*t1r_surf*t2r_surf*tgf_beta*V_cyt/V_extra

seques_calvelolar_lrc: 
    lrc_surf > lrc_cave
    ki_cave*lrc_surf

seques_ee_lrc: 
    lrc_surf > lrc_ee
    ki_ee*lrc_surf

deseques_cal_t1r: 
    lrc_cave > t1r_surf + t2r_surf 
    kr_cave*lrc_cave
eg1: 
    lrc_cave > tgf_beta
    kr_cave*lrc_cave*(V_cyt/V_extra)
eg2:
    t2r_ee > tgf_beta
    kr_ee*t2r_ee*(V_cyt/V_extra)


ligand_induced_degradation: 
    lrc_cave  > $pool 
    k_lid*lrc_cave*smad_comp_nuc

lrc_ee_degradation: 
    lrc_ee > $pool
    kcd*lrc_ee

smad2_nuclear_import:
    smad2_cyt = smad2_nuc
    kimp_smad2*smad2_cyt*(V_cyt/V_nuc)-
    kexp_smad2*smad2_nuc*(V_nuc/V_cyt)

smad4_nuclear_import: 
    smad4_cyt = smad4_nuc
    kimp_smad4*smad4_cyt*(V_cyt/V_nuc)-
    kexp_smad4*smad4_nuc*(V_nuc/V_cyt)

complex_formation: 
    smad2_cyt + smad4_cyt > smad_comp_cyt
    ksmad*smad2_cyt*smad4_cyt*lrc_ee

smad_complex_nuclear_import: 
    smad_comp_cyt > smad_comp_nuc
    ksmad_imp*smad_comp_cyt*(V_cyt/V_nuc)

smad_complex_dissociation_nucleus: 
    smad_comp_nuc > smad2_nuc + smad4_nuc 
    ksmad_dis*smad_comp_nuc


t1r_surf = 0.237
t1r_cave = 2.092
t1r_ee   = 2.06
t2r_surf = 0.202
t2r_cave = 1.778
t2r_ee   = 1.148
lrc_surf = 1.0e-8
lrc_cave = 1.0e-8
lrc_ee   = 1.0e-8
smad2_cyt = 492.61
smad2_nuc = 236.45
smad4_cyt = 1149.4
smad4_nuc = 551.72
smad_comp_cyt = 1.0e-8
smad_comp_nuc = 1.0e-8
tgf_beta = 0.08

v_tir = 0.0103
v_t2r = 0.02869
ki_ee = 0.33
kr_ee = 0.033
ki_cave = 0.33
kr_cave = 0.0372
kcd = 0.005
k_lrc = 2197
k_lid = 0.02609
kdeg_t1r = 0.005 
kdeg_t2r = 0.025 
kimp_smad2 = 0.16 
kexp_smad2 = 1 
kimp_smad4 = 0.08
kexp_smad4 = 0.5 
ksmad = 6.85e-5 
ksmad_imp = 0.16 
ksmad_dis = 0.1174 
V_cyt = 3.0
V_nuc = 1.0
V_extra = 3000

