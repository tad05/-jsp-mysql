package voting;

public class VotingDTO {
	
	private int postsID;
	private String candidateName;
	private int votingYear;
	private String candidateContent;
	private int voteCount;


	public int getPostsID() {
		return postsID;
	}

	public void setPostsID(int postsID) {
		this.postsID = postsID;
	}

	public String getCandidateName() {
		return candidateName;
	}

	public void setCandidateName(String candidateName) {
		this.candidateName = candidateName;
	}

	public int getVotingYear() {
		return votingYear;
	}

	public void setVotingYear(int votingYear) {
		this.votingYear = votingYear;
	}

	public String getCandidateContent() {
		return candidateContent;
	}

	public void setCandidateContent(String candidateContent) {
		this.candidateContent = candidateContent;
	}

	public int getVoteCount() {
		return voteCount;
	}

	public void setVoteCount(int voteCount) {
		this.voteCount = voteCount;
	}
	public VotingDTO() {

	}

	public VotingDTO(int postsID, String candidateName, int votingYear, String candidateContent, int voteCount) {
		this.postsID = postsID;
		this.candidateName = candidateName;
		this.votingYear = votingYear;
		this.candidateContent = candidateContent;
		this.voteCount = voteCount;
	}

	
	
}
