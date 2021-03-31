package util;

public class mytest {

	public static void main(String[] args) {
		String link = "https://www.youtube.com/watch?v=7edC7JF4S1E";
		
		int idx = link.lastIndexOf("=");
		if(idx == -1) {
			// 오류메시지
		}
		
		link = link.substring(idx+1);
		
		System.out.println(link);
		
		if(link.equals("7edC7JF4S1E")) {
			System.out.println("정상작동중입니다");
		}else {
			System.out.println("다시만들어");
		}

	}

}
