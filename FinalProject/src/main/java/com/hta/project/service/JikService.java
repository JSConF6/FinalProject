package com.hta.project.service;

import java.util.List;

import com.hta.project.domain.Jik;

public interface JikService {
	
	// ���� ���� ���ϱ�
	public int getListCount();
	
	// �� ��� ����
	public List<Jik> getJikList(int page, int limit);
	
	// �� ���� ����
	public Jik getDetail(int num);
	
	// �� �亯
	public int jikReply(Jik jik);
	
	// �� ����
	public int jikModify(Jik modifyjik);
	
	// �� ����
	public int jikDelete(int num);
	
	// ��ȸ�� ������Ʈ
	public int setReadCountUpdate(int num);
	
	// �۾������� Ȯ��
	public boolean isJikWriter(int num, String pass);
	
	// �� ����ϱ�
	public void insertJik(Jik jik);

	//Jik_RE_SEQ�� ����
	public int jikReplyUpdate(Jik jik);

	
}
