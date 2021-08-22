class Solution:
    def maxProfit(self, prices: list) -> int:
        rarr = [0]
        buy = prices[0]
        for i in range(1,len(prices)):
            if prices[i]< buy:
                rarr.append(rarr[i-1])
                buy = prices[i] 
            else:
                if prices[i]-buy>rarr[i-1]:
                    rarr.append(prices[i]-buy)
                else:
                    rarr.append(rarr[i-1])
        # from right to left
        i = len(prices)-2
        buy = prices[i+1]
        maxprofit = rarr[-1]
        while i!=0:
            if prices[i]<buy:# buy must be the height
                profit = buy-prices[i]
                if profit+rarr[i]> maxprofit:
                    maxprofit = profit+rarr[i]
        
            else:
                buy= prices[i]
                if profit+rarr[i]> maxprofit:
                    maxprofit = profit+rarr[i]
            i-=1
        
        return maxprofit

print(Solution().maxProfit([6,1,3,2,4,7]))
