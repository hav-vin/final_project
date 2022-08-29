package sansil.gxsx.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;

@Controller
public class KakaoController {
	private final static String K_CLIENT_ID = "1b172907c75e31d1b0b32730ffc05e8c"; //이런식으로 REDIRECT_URI를 써넣는다. 
	 
	private final static String K_REDIRECT_URI = "http://127.0.0.1:8080/GxSx/gxsx/kakaologin.do"; //로그인
	public static String getAuthorizationUrl(HttpSession session) { 
		String kakaoUrl = "https://kauth.kakao.com/oauth/authorize?" + "client_id=" + K_CLIENT_ID 
				+ "&redirect_uri=" + K_REDIRECT_URI + "&response_type=code"; 
		return kakaoUrl;
				} 

	private final static String K_REDIRECT_URI2 = "http://127.0.0.1:8080/GxSx/gxsx/kakaologout.do";  //로그아웃
	public static String getAuthorizationUrl2(HttpSession session) { 
		String kakaoUrl = "https://kauth.kakao.com/oauth/logout?" + "client_id=" + K_CLIENT_ID 
				+ "&logout_redirect_uri=" + K_REDIRECT_URI2; 
		return kakaoUrl;
				}

	public static JsonNode getAccessToken(String autorize_code) { 
		final String RequestUrl = "https://kauth.kakao.com/oauth/token"; 
		final List<NameValuePair> postParams = new ArrayList<NameValuePair>(); 
		postParams.add(new BasicNameValuePair("grant_type", "authorization_code")); 
		postParams.add(new BasicNameValuePair("client_id", "1b172907c75e31d1b0b32730ffc05e8c")); // REST API KEY 
		postParams.add(new BasicNameValuePair("redirect_uri", "http://127.0.0.1:8080/GxSx/gxsx/kakaologin.do")); // 리다이렉트 URI 
		postParams.add(new BasicNameValuePair("code", autorize_code)); // 로그인 과정중 얻은 code 값 
		final HttpClient client = HttpClientBuilder.create().build(); 
		final HttpPost post = new HttpPost(RequestUrl); 
		JsonNode returnNode = null; 
		try { 
			post.setEntity(new UrlEncodedFormEntity(postParams)); 
			final HttpResponse response = client.execute(post); // JSON 형태 반환값 처리
			ObjectMapper mapper = new ObjectMapper(); 
			returnNode = mapper.readTree(response.getEntity().getContent()); 
			} 
		catch (UnsupportedEncodingException e) { 
			e.printStackTrace(); 
			} 
		catch (ClientProtocolException e) { 
			e.printStackTrace(); 
			} 
		catch (IOException e) { 
			e.printStackTrace(); 
			} 
		finally { 
			// clear resources 
			} 
		return returnNode; 
		} 
	
	public static JsonNode getKakaoUserInfo(JsonNode accessToken) { 
		final String RequestUrl = "https://kapi.kakao.com/v2/user/me"; 
		final HttpClient client = HttpClientBuilder.create().build(); 
		final HttpPost post = new HttpPost(RequestUrl); // add header 
		post.addHeader("Authorization", "Bearer " + accessToken); 
		JsonNode returnNode = null; 
		try { 
			final HttpResponse response = client.execute(post); // JSON 형태 반환값 처리
			ObjectMapper mapper = new ObjectMapper(); 
			returnNode = mapper.readTree(response.getEntity().getContent()); 
			} 
		catch (ClientProtocolException e) { 
			e.printStackTrace(); 
			} 
		catch (IOException e) { 
			e.printStackTrace(); 
			} 
		finally { 
			// clear resources 
			} 
		return returnNode; 
		}

	public static JsonNode Logout(String autorize_code) { //로그아웃
		final String RequestUrl = "https://kapi.kakao.com/v1/user/logout";
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);
		
		post.addHeader("Authorization", "Bearer " + autorize_code);

		JsonNode returnNode = null;

		try {
			final HttpResponse response = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
		}

		return returnNode;
	}

}