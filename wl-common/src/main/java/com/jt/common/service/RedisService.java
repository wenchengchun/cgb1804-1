package com.jt.common.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisSentinelPool;
import redis.clients.jedis.ShardedJedis;
import redis.clients.jedis.ShardedJedisPool;

@Service
public class RedisService {
	//添加@autowired表示立即注入jedisPool
	//原因：因为有些项目不需要使用缓存，则没有这个bean对象所有需要懒加载
	@Autowired(required=false)	//当程序调用时注入对象
	private ShardedJedisPool jedisPool;
/*	@Autowired(required=false)
	private JedisSentinelPool sentinelPool;*/
	
	public void set(String key,String value){
		ShardedJedis jedis=jedisPool.getResource();
		jedis.set(key, value);
		jedisPool.returnResource(jedis);
	}
	public void set(String key,int seconds,String value){
		ShardedJedis jedis=jedisPool.getResource();
		jedis.setex(key,seconds, value);
		jedisPool.returnResource(jedis);
	}
	
	public String get(String key){
		ShardedJedis jedis=jedisPool.getResource();
		String result = jedis.get(key);
		jedisPool.returnResource(jedis);
		return result;
	}
	
/*	public void set(String key,String value){
		Jedis jedis = sentinelPool.getResource();
		jedis.set(key, value);
		sentinelPool.returnResource(jedis);
	}
	public String get(String key){
		Jedis jedis = sentinelPool.getResource();
		String result = jedis.get(key);
		sentinelPool.returnResource(jedis);
		return result;
		
	}*/
}
