package com.cloudalibaba.nacos.test;

import java.util.concurrent.*;

/**
 * @author wqy
 * @version 1.0
 * @date 2020/8/1 9:50
 */
public class ThreadTest {

    public static void main(String[] args) throws ExecutionException, InterruptedException {

        //创建线程池
        ExecutorService executorService = Executors.newSingleThreadExecutor();

        //创建任务
        Callable<String> callable = ()->{
          System.out.println("进入Callable的call方法");
          Thread.sleep(5000);
          return "Hello from Callable";
        };

        //提交任务到线程池
        Future<String> future = executorService.submit(callable);
        System.out.println("z主线程继续执行");
        Long startTime = System.currentTimeMillis();
        while (!future.isDone()){
            System.out.println("子线程未结束");
            Thread.sleep(1000);
            double elapsedTimeInSec = (System.nanoTime()-startTime)/1000000000.0;
            if(elapsedTimeInSec>1){
                future.cancel(true);
            }
        }
        //判断任务是否被取消
        if(!future.isCancelled()){
            System.out.println("主线程等待获取Future结果");
            String result = future.get();
            System.out.println("获取到的结果"+result);
            executorService.shutdown();
        }else{
            System.out.println("子线程任务被取消");
        }

    }

}
