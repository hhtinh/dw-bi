
CREATE PROCEDURE [dbo].[LoadData]  
AS  
BEGIN  
DROP TABLE IF EXISTS [dbo].[LoanStats]
CREATE TABLE [dbo].[LoanStats](
	[id] [int] NULL,
	[member_id] [int] NULL,
	[loan_amnt] [int] NULL,
	[funded_amnt] [int] NULL,
	[funded_amnt_inv] [int] NULL,
	[term] [nvarchar](max) NULL,
	[int_rate] [nvarchar](max) NULL,
	[installment] [float] NULL,
	[grade] [nvarchar](max) NULL,
	[sub_grade] [nvarchar](max) NULL,
	[emp_title] [nvarchar](max) NULL,
	[emp_length] [nvarchar](max) NULL,
	[home_ownership] [nvarchar](max) NULL,
	[annual_inc] [float] NULL,
	[verification_status] [nvarchar](max) NULL,
	[issue_d] [nvarchar](max) NULL,
	[loan_status] [nvarchar](max) NULL,
	[pymnt_plan] [nvarchar](max) NULL,
	[url] [nvarchar](max) NULL,
	[desc] [nvarchar](max) NULL,
	[purpose] [nvarchar](max) NULL,
	[title] [nvarchar](max) NULL,
	[zip_code] [nvarchar](max) NULL,
	[addr_state] [nvarchar](max) NULL,
	[dti] [float] NULL,
	[delinq_2yrs] [int] NULL,
	[earliest_cr_line] [nvarchar](max) NULL,
	[inq_last_6mths] [int] NULL,
	[mths_since_last_delinq] [int] NULL,
	[mths_since_last_record] [int] NULL,
	[open_acc] [int] NULL,
	[pub_rec] [int] NULL,
	[revol_bal] [int] NULL,
	[revol_util] [nvarchar](max) NULL,
	[total_acc] [int] NULL,
	[initial_list_status] [nvarchar](max) NULL,
	[out_prncp] [float] NULL,
	[out_prncp_inv] [float] NULL,
	[total_pymnt] [float] NULL,
	[total_pymnt_inv] [float] NULL,
	[total_rec_prncp] [float] NULL,
	[total_rec_int] [float] NULL,
	[total_rec_late_fee] [float] NULL,
	[recoveries] [float] NULL,
	[collection_recovery_fee] [float] NULL,
	[last_pymnt_d] [nvarchar](max) NULL,
	[last_pymnt_amnt] [float] NULL,
	[next_pymnt_d] [nvarchar](max) NULL,
	[last_credit_pull_d] [nvarchar](max) NULL,
	[collections_12_mths_ex_med] [int] NULL,
	[mths_since_last_major_derog] [int] NULL,
	[policy_code] [int] NULL,
	[application_type] [nvarchar](max) NULL,
	[annual_inc_joint] [float] NULL,
	[dti_joint] [float] NULL,
	[verification_status_joint] [nvarchar](max) NULL,
	[acc_now_delinq] [int] NULL,
	[tot_coll_amt] [int] NULL,
	[tot_cur_bal] [int] NULL,
	[open_acc_6m] [int] NULL,
	[open_il_6m] [int] NULL,
	[open_il_12m] [int] NULL,
	[open_il_24m] [int] NULL,
	[mths_since_rcnt_il] [int] NULL,
	[total_bal_il] [int] NULL,
	[il_util] [float] NULL,
	[open_rv_12m] [int] NULL,
	[open_rv_24m] [int] NULL,
	[max_bal_bc] [int] NULL,
	[all_util] [float] NULL,
	[total_rev_hi_lim] [int] NULL,
	[inq_fi] [int] NULL,
	[total_cu_tl] [int] NULL,
	[inq_last_12m] [int] NULL,
	[acc_open_past_24mths] [int] NULL,
	[avg_cur_bal] [int] NULL,
	[bc_open_to_buy] [int] NULL,
	[bc_util] [float] NULL,
	[chargeoff_within_12_mths] [int] NULL,
	[delinq_amnt] [int] NULL,
	[mo_sin_old_il_acct] [int] NULL,
	[mo_sin_old_rev_tl_op] [int] NULL,
	[mo_sin_rcnt_rev_tl_op] [int] NULL,
	[mo_sin_rcnt_tl] [int] NULL,
	[mort_acc] [int] NULL,
	[mths_since_recent_bc] [int] NULL,
	[mths_since_recent_bc_dlq] [int] NULL,
	[mths_since_recent_inq] [int] NULL,
	[mths_since_recent_revol_delinq] [int] NULL,
	[num_accts_ever_120_pd] [int] NULL,
	[num_actv_bc_tl] [int] NULL,
	[num_actv_rev_tl] [int] NULL,
	[num_bc_sats] [int] NULL,
	[num_bc_tl] [int] NULL,
	[num_il_tl] [int] NULL,
	[num_op_rev_tl] [int] NULL,
	[num_rev_accts] [int] NULL,
	[num_rev_tl_bal_gt_0] [int] NULL,
	[num_sats] [int] NULL,
	[num_tl_120dpd_2m] [int] NULL,
	[num_tl_30dpd] [int] NULL,
	[num_tl_90g_dpd_24m] [int] NULL,
	[num_tl_op_past_12m] [int] NULL,
	[pct_tl_nvr_dlq] [float] NULL,
	[percent_bc_gt_75] [float] NULL,
	[pub_rec_bankruptcies] [int] NULL,
	[tax_liens] [int] NULL,
	[tot_hi_cred_lim] [int] NULL,
	[total_bal_ex_mort] [int] NULL,
	[total_bc_limit] [int] NULL,
	[total_il_high_credit_limit] [int] NULL	
) 

INSERT INTO [dbo].[LoanStats]
EXEC sp_execute_external_script 
@language = N'R',
@script = N'OutputDataSet <- read.csv("C:/lendingclub/LoanStats3a.csv", h=T,sep = ",")'

INSERT INTO [dbo].[LoanStats]
EXEC sp_execute_external_script 
@language = N'R',
@script = N'OutputDataSet <- read.csv("C:/lendingclub/LoanStats3b.csv", h=T,sep = ",")'

INSERT INTO [dbo].[LoanStats]
EXEC sp_execute_external_script 
@language = N'R',
@script = N'OutputDataSet <- read.csv("C:/lendingclub/LoanStats3c.csv", h=T,sep = ",")'

INSERT INTO [dbo].[LoanStats]
EXEC sp_execute_external_script 
@language = N'R',
@script = N'OutputDataSet <- read.csv("C:/lendingclub/LoanStats3d.csv", h=T,sep = ",")'

INSERT INTO [dbo].[LoanStats]
EXEC sp_execute_external_script 
@language = N'R',
@script = N'OutputDataSet <- read.csv("C:/lendingclub/LoanStats_2016Q1.csv", h=T,sep = ",")'

INSERT INTO [dbo].[LoanStats]
EXEC sp_execute_external_script 
@language = N'R',
@script = N'OutputDataSet <- read.csv("C:/lendingclub/LoanStats_2016Q2.csv", h=T,sep = ",")'
                                  
END  
