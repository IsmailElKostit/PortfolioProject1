#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd

import matplotlib.pyplot as plt
get_ipython().run_line_magic('matplotlib', 'inline')

import seaborn as sns


# In[2]:


df = pd.read_excel('superstore_sales.xlsx')


# In[3]:


df.head()


# In[4]:


df.shape


# In[5]:


df.describe()


# In[7]:


#WHAT IS THE OVERALL SALES TREND?


# In[8]:


df['month_year'] = df['order_date'].apply(lambda x: x.strftime('%Y-%m'))


# In[11]:


df_temp = df.groupby('month_year')['sales'].sum().reset_index()


# In[13]:


plt.figure(figsize=(16, 5))
plt.plot(df_temp['month_year'], df_temp['sales'], color='#b80045')
plt.xticks(rotation='vertical', size=8)
plt.show()


# In[14]:


#WHICH ARE THE TOP 10 PRODUCTS BY SALES?


# In[17]:


prod_sales = pd.DataFrame(df.groupby('product_name')['sales'].sum())


# In[18]:


prod_sales.sort_values(by=['sales'], inplace=True, ascending=False)


# In[19]:


prod_sales[:10]


# In[20]:


#WHICH ARE THE MOST SELLING PRODUCTS?


# In[22]:


best_selling_prods = pd.DataFrame(df.groupby('product_name')['quantity'].sum())


# In[23]:


best_selling_prods.sort_values(by=['quantity'], inplace=True, ascending=False)


# In[24]:


best_selling_prods[:10]


# In[25]:


#WHAT IS THE MOST PREFERRED SHIP MODE?


# In[28]:


plt.figure(figsize=(10, 8))
sns.countplot(x='ship_mode', data=df)
plt.show()


# In[29]:


#WHICH ARE THE MOST PROFITABLE CATEGORY AND SUB-CATEGORY?


# In[31]:


cat_subcat = pd.DataFrame(df.groupby(['category', 'sub_category'])['profit'].sum())


# In[32]:


cat_subcat.sort_values(['category','profit'], ascending=False)

