package kr.goott.tour.register;

public interface RegisterDAOInterface {

	public int idCheck(String userId); //���̵� �ߺ��˻�
	
	public int insertRecord(RegisterVO vo); //ȸ�����
	
	public RegisterVO login(RegisterVO vo); //�α���
	
	public int updateRecord(RegisterVO vo); //ȸ����������
	
	public void getRegister(RegisterVO vo); //ȸ������ ��������
	
	public void findId(RegisterVO vo); //���̵� ã��
	
	public void findPwd(RegisterVO vo); //��й�ȣ ã��

	public RegisterVO selectRecord(String userId);//ȸ�����Լ��� ��
	
	public int deleteRecord(String userId, String userPwd);
	
}
