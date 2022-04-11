package kr.co.weather.service;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.parser.ParseException;

import kr.co.weather.domain.*;

public interface WeatherService {
	//현재일 기준으로 10일 간의 기온 예측
	public Map<String, Object> getAnalysis(HttpServletRequest request);
	
	//기간별 날씨 데이터 조회
	public Map<String, Object> selectWeatherPeriod(HttpServletRequest request);
	
	//Grid 테이블의 데이터 불러오기
	public List<Grid> selectGrid();

	//api로 초단기 현황 불러오기 -> 현재 위치는 종로구로 고정되어 있음 수정 가능
	public Weather getultrasrtncst(String grid_x, String grid_y) throws IOException, ParseException;

	//특보 데이터 생성하기
	public void insertWarning(int record_id);

	//일일 데이터 삽입
	public void insertDayInfo(String startdate, String enddate);
	
	
	//search record by date & location
	public List<Record> searchRecord(Integer location_id);
	
	//Data Processing
	public void get_Tmp(Integer location_id);
	public void get_rain_humid_snow(Integer location_id);

	/*
	 필요한 함수들 overall
	 record & warning join
	 1. Date(year/month/day) & location(city/state) -> 6 combination
	 
	 member
	 1. sign up
	 2. sign in (log in)
	 3. sign out
	 4. terminate account
	 */
}