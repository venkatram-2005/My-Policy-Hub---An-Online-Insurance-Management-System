package Objects;

public class InsurancePlan {
    private int planId;
    private String planCategory;
    private String planName;
    private String planDesc;
    private String planTier;
    private String ageGroup;
    private String planForGender;
    private double premium;
    private double coverageAmount;

    public InsurancePlan(int planId, String planCategory, String planName, String planDesc, 
                         String planTier, String ageGroup, String planForGender, 
                         double premium, double coverageAmount) {
        this.planId = planId;
        this.planCategory = planCategory;
        this.planName = planName;
        this.planDesc = planDesc;
        this.planTier = planTier;
        this.ageGroup = ageGroup;
        this.planForGender = planForGender;
        this.premium = premium;
        this.coverageAmount = coverageAmount;
    }

    public InsurancePlan() {
		// TODO Auto-generated constructor stub
	}

	public int getPlanId() {
        return planId;
    }

    public String getPlanCategory() {
        return planCategory;
    }

    public String getPlanName() {
        return planName;
    }

    public String getPlanDesc() {
        return planDesc;
    }

    public String getPlanTier() {
        return planTier;
    }

    public String getAgeGroup() {
        return ageGroup;
    }

    public String getPlanForGender() {
        return planForGender;
    }

    public double getPremium() {
        return premium;
    }

    public double getCoverageAmount() {
        return coverageAmount;
    }
    
 // Setter for planId
    public void setPlanId(int planId) {
        this.planId = planId;
    }

    // Setter for planName
    public void setPlanName(String planName) {
        this.planName = planName;
    }

    // Setter for planDesc
    public void setPlanDesc(String planDesc) {
        this.planDesc = planDesc;
    }

    // Setter for planTier
    public void setPlanTier(String planTier) {
        this.planTier = planTier;
    }

    // Setter for ageGroup
    public void setAgeGroup(String ageGroup) {
        this.ageGroup = ageGroup;
    }

    // Setter for planForGender
    public void setPlanForGender(String planForGender) {
        this.planForGender = planForGender;
    }

    // Setter for premium
    public void setPremium(double premium) {
        this.premium = premium;
    }

    // Setter for coverageAmount
    public void setCoverageAmount(double coverageAmount) {
        this.coverageAmount = coverageAmount;
    }

	
}

