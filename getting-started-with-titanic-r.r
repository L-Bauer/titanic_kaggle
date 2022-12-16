{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "d2156465",
   "metadata": {
    "_cell_guid": "66034bf7-3af5-43a0-a41d-96ee8067b520",
    "_uuid": "9e27afe2-f247-4b34-bf47-ebe2dde9089e",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2022-12-16T18:22:57.979825Z",
     "iopub.status.busy": "2022-12-16T18:22:57.976893Z",
     "iopub.status.idle": "2022-12-16T18:22:58.154615Z",
     "shell.execute_reply": "2022-12-16T18:22:58.147329Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.186654,
     "end_time": "2022-12-16T18:22:58.158109",
     "exception": false,
     "start_time": "2022-12-16T18:22:57.971455",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "randomForest 4.6-14\n",
      "\n",
      "Type rfNews() to see new features/changes/bug fixes.\n",
      "\n"
     ]
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"Loading complete!\"\n"
     ]
    }
   ],
   "source": [
    "# Let's start by loading some helpful packages:\n",
    "\n",
    "library(randomForest)\n",
    "print('Loading complete!')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "ae54dcdf",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-16T18:22:58.193938Z",
     "iopub.status.busy": "2022-12-16T18:22:58.164410Z",
     "iopub.status.idle": "2022-12-16T18:22:58.249874Z",
     "shell.execute_reply": "2022-12-16T18:22:58.248144Z"
    },
    "papermill": {
     "duration": 0.092001,
     "end_time": "2022-12-16T18:22:58.252539",
     "exception": false,
     "start_time": "2022-12-16T18:22:58.160538",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 12</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>PassengerId</th><th scope=col>Survived</th><th scope=col>Pclass</th><th scope=col>Name</th><th scope=col>Sex</th><th scope=col>Age</th><th scope=col>SibSp</th><th scope=col>Parch</th><th scope=col>Ticket</th><th scope=col>Fare</th><th scope=col>Cabin</th><th scope=col>Embarked</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>0</td><td>3</td><td>Braund, Mr. Owen Harris                            </td><td>male  </td><td>22</td><td>1</td><td>0</td><td>A/5 21171       </td><td> 7.2500</td><td>    </td><td>S</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>2</td><td>1</td><td>1</td><td>Cumings, Mrs. John Bradley (Florence Briggs Thayer)</td><td>female</td><td>38</td><td>1</td><td>0</td><td>PC 17599        </td><td>71.2833</td><td>C85 </td><td>C</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>3</td><td>1</td><td>3</td><td>Heikkinen, Miss. Laina                             </td><td>female</td><td>26</td><td>0</td><td>0</td><td>STON/O2. 3101282</td><td> 7.9250</td><td>    </td><td>S</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>4</td><td>1</td><td>1</td><td>Futrelle, Mrs. Jacques Heath (Lily May Peel)       </td><td>female</td><td>35</td><td>1</td><td>0</td><td>113803          </td><td>53.1000</td><td>C123</td><td>S</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>5</td><td>0</td><td>3</td><td>Allen, Mr. William Henry                           </td><td>male  </td><td>35</td><td>0</td><td>0</td><td>373450          </td><td> 8.0500</td><td>    </td><td>S</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>6</td><td>0</td><td>3</td><td>Moran, Mr. James                                   </td><td>male  </td><td>NA</td><td>0</td><td>0</td><td>330877          </td><td> 8.4583</td><td>    </td><td>Q</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 12\n",
       "\\begin{tabular}{r|llllllllllll}\n",
       "  & PassengerId & Survived & Pclass & Name & Sex & Age & SibSp & Parch & Ticket & Fare & Cabin & Embarked\\\\\n",
       "  & <int> & <int> & <int> & <chr> & <chr> & <dbl> & <int> & <int> & <chr> & <dbl> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t1 & 1 & 0 & 3 & Braund, Mr. Owen Harris                             & male   & 22 & 1 & 0 & A/5 21171        &  7.2500 &      & S\\\\\n",
       "\t2 & 2 & 1 & 1 & Cumings, Mrs. John Bradley (Florence Briggs Thayer) & female & 38 & 1 & 0 & PC 17599         & 71.2833 & C85  & C\\\\\n",
       "\t3 & 3 & 1 & 3 & Heikkinen, Miss. Laina                              & female & 26 & 0 & 0 & STON/O2. 3101282 &  7.9250 &      & S\\\\\n",
       "\t4 & 4 & 1 & 1 & Futrelle, Mrs. Jacques Heath (Lily May Peel)        & female & 35 & 1 & 0 & 113803           & 53.1000 & C123 & S\\\\\n",
       "\t5 & 5 & 0 & 3 & Allen, Mr. William Henry                            & male   & 35 & 0 & 0 & 373450           &  8.0500 &      & S\\\\\n",
       "\t6 & 6 & 0 & 3 & Moran, Mr. James                                    & male   & NA & 0 & 0 & 330877           &  8.4583 &      & Q\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 12\n",
       "\n",
       "| <!--/--> | PassengerId &lt;int&gt; | Survived &lt;int&gt; | Pclass &lt;int&gt; | Name &lt;chr&gt; | Sex &lt;chr&gt; | Age &lt;dbl&gt; | SibSp &lt;int&gt; | Parch &lt;int&gt; | Ticket &lt;chr&gt; | Fare &lt;dbl&gt; | Cabin &lt;chr&gt; | Embarked &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1 | 0 | 3 | Braund, Mr. Owen Harris                             | male   | 22 | 1 | 0 | A/5 21171        |  7.2500 | <!----> | S |\n",
       "| 2 | 2 | 1 | 1 | Cumings, Mrs. John Bradley (Florence Briggs Thayer) | female | 38 | 1 | 0 | PC 17599         | 71.2833 | C85  | C |\n",
       "| 3 | 3 | 1 | 3 | Heikkinen, Miss. Laina                              | female | 26 | 0 | 0 | STON/O2. 3101282 |  7.9250 | <!----> | S |\n",
       "| 4 | 4 | 1 | 1 | Futrelle, Mrs. Jacques Heath (Lily May Peel)        | female | 35 | 1 | 0 | 113803           | 53.1000 | C123 | S |\n",
       "| 5 | 5 | 0 | 3 | Allen, Mr. William Henry                            | male   | 35 | 0 | 0 | 373450           |  8.0500 | <!----> | S |\n",
       "| 6 | 6 | 0 | 3 | Moran, Mr. James                                    | male   | NA | 0 | 0 | 330877           |  8.4583 | <!----> | Q |\n",
       "\n"
      ],
      "text/plain": [
       "  PassengerId Survived Pclass\n",
       "1 1           0        3     \n",
       "2 2           1        1     \n",
       "3 3           1        3     \n",
       "4 4           1        1     \n",
       "5 5           0        3     \n",
       "6 6           0        3     \n",
       "  Name                                                Sex    Age SibSp Parch\n",
       "1 Braund, Mr. Owen Harris                             male   22  1     0    \n",
       "2 Cumings, Mrs. John Bradley (Florence Briggs Thayer) female 38  1     0    \n",
       "3 Heikkinen, Miss. Laina                              female 26  0     0    \n",
       "4 Futrelle, Mrs. Jacques Heath (Lily May Peel)        female 35  1     0    \n",
       "5 Allen, Mr. William Henry                            male   35  0     0    \n",
       "6 Moran, Mr. James                                    male   NA  0     0    \n",
       "  Ticket           Fare    Cabin Embarked\n",
       "1 A/5 21171         7.2500       S       \n",
       "2 PC 17599         71.2833 C85   C       \n",
       "3 STON/O2. 3101282  7.9250       S       \n",
       "4 113803           53.1000 C123  S       \n",
       "5 373450            8.0500       S       \n",
       "6 330877            8.4583       Q       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "train_data = read.csv(\"/kaggle/input/titanic/train.csv\", header = TRUE)\n",
    "head(train_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "6148ae91",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-16T18:22:58.261090Z",
     "iopub.status.busy": "2022-12-16T18:22:58.259596Z",
     "iopub.status.idle": "2022-12-16T18:22:58.296045Z",
     "shell.execute_reply": "2022-12-16T18:22:58.294325Z"
    },
    "papermill": {
     "duration": 0.043505,
     "end_time": "2022-12-16T18:22:58.298605",
     "exception": false,
     "start_time": "2022-12-16T18:22:58.255100",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 11</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>PassengerId</th><th scope=col>Pclass</th><th scope=col>Name</th><th scope=col>Sex</th><th scope=col>Age</th><th scope=col>SibSp</th><th scope=col>Parch</th><th scope=col>Ticket</th><th scope=col>Fare</th><th scope=col>Cabin</th><th scope=col>Embarked</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>892</td><td>3</td><td>Kelly, Mr. James                            </td><td>male  </td><td>34.5</td><td>0</td><td>0</td><td>330911 </td><td> 7.8292</td><td></td><td>Q</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>893</td><td>3</td><td>Wilkes, Mrs. James (Ellen Needs)            </td><td>female</td><td>47.0</td><td>1</td><td>0</td><td>363272 </td><td> 7.0000</td><td></td><td>S</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>894</td><td>2</td><td>Myles, Mr. Thomas Francis                   </td><td>male  </td><td>62.0</td><td>0</td><td>0</td><td>240276 </td><td> 9.6875</td><td></td><td>Q</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>895</td><td>3</td><td>Wirz, Mr. Albert                            </td><td>male  </td><td>27.0</td><td>0</td><td>0</td><td>315154 </td><td> 8.6625</td><td></td><td>S</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>896</td><td>3</td><td>Hirvonen, Mrs. Alexander (Helga E Lindqvist)</td><td>female</td><td>22.0</td><td>1</td><td>1</td><td>3101298</td><td>12.2875</td><td></td><td>S</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>897</td><td>3</td><td>Svensson, Mr. Johan Cervin                  </td><td>male  </td><td>14.0</td><td>0</td><td>0</td><td>7538   </td><td> 9.2250</td><td></td><td>S</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 11\n",
       "\\begin{tabular}{r|lllllllllll}\n",
       "  & PassengerId & Pclass & Name & Sex & Age & SibSp & Parch & Ticket & Fare & Cabin & Embarked\\\\\n",
       "  & <int> & <int> & <chr> & <chr> & <dbl> & <int> & <int> & <chr> & <dbl> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t1 & 892 & 3 & Kelly, Mr. James                             & male   & 34.5 & 0 & 0 & 330911  &  7.8292 &  & Q\\\\\n",
       "\t2 & 893 & 3 & Wilkes, Mrs. James (Ellen Needs)             & female & 47.0 & 1 & 0 & 363272  &  7.0000 &  & S\\\\\n",
       "\t3 & 894 & 2 & Myles, Mr. Thomas Francis                    & male   & 62.0 & 0 & 0 & 240276  &  9.6875 &  & Q\\\\\n",
       "\t4 & 895 & 3 & Wirz, Mr. Albert                             & male   & 27.0 & 0 & 0 & 315154  &  8.6625 &  & S\\\\\n",
       "\t5 & 896 & 3 & Hirvonen, Mrs. Alexander (Helga E Lindqvist) & female & 22.0 & 1 & 1 & 3101298 & 12.2875 &  & S\\\\\n",
       "\t6 & 897 & 3 & Svensson, Mr. Johan Cervin                   & male   & 14.0 & 0 & 0 & 7538    &  9.2250 &  & S\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 11\n",
       "\n",
       "| <!--/--> | PassengerId &lt;int&gt; | Pclass &lt;int&gt; | Name &lt;chr&gt; | Sex &lt;chr&gt; | Age &lt;dbl&gt; | SibSp &lt;int&gt; | Parch &lt;int&gt; | Ticket &lt;chr&gt; | Fare &lt;dbl&gt; | Cabin &lt;chr&gt; | Embarked &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 892 | 3 | Kelly, Mr. James                             | male   | 34.5 | 0 | 0 | 330911  |  7.8292 | <!----> | Q |\n",
       "| 2 | 893 | 3 | Wilkes, Mrs. James (Ellen Needs)             | female | 47.0 | 1 | 0 | 363272  |  7.0000 | <!----> | S |\n",
       "| 3 | 894 | 2 | Myles, Mr. Thomas Francis                    | male   | 62.0 | 0 | 0 | 240276  |  9.6875 | <!----> | Q |\n",
       "| 4 | 895 | 3 | Wirz, Mr. Albert                             | male   | 27.0 | 0 | 0 | 315154  |  8.6625 | <!----> | S |\n",
       "| 5 | 896 | 3 | Hirvonen, Mrs. Alexander (Helga E Lindqvist) | female | 22.0 | 1 | 1 | 3101298 | 12.2875 | <!----> | S |\n",
       "| 6 | 897 | 3 | Svensson, Mr. Johan Cervin                   | male   | 14.0 | 0 | 0 | 7538    |  9.2250 | <!----> | S |\n",
       "\n"
      ],
      "text/plain": [
       "  PassengerId Pclass Name                                         Sex    Age \n",
       "1 892         3      Kelly, Mr. James                             male   34.5\n",
       "2 893         3      Wilkes, Mrs. James (Ellen Needs)             female 47.0\n",
       "3 894         2      Myles, Mr. Thomas Francis                    male   62.0\n",
       "4 895         3      Wirz, Mr. Albert                             male   27.0\n",
       "5 896         3      Hirvonen, Mrs. Alexander (Helga E Lindqvist) female 22.0\n",
       "6 897         3      Svensson, Mr. Johan Cervin                   male   14.0\n",
       "  SibSp Parch Ticket  Fare    Cabin Embarked\n",
       "1 0     0     330911   7.8292       Q       \n",
       "2 1     0     363272   7.0000       S       \n",
       "3 0     0     240276   9.6875       Q       \n",
       "4 0     0     315154   8.6625       S       \n",
       "5 1     1     3101298 12.2875       S       \n",
       "6 0     0     7538     9.2250       S       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "test_data = read.csv(\"/kaggle/input/titanic/test.csv\", header = TRUE)\n",
    "head(test_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "9b4cedcb",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-16T18:22:58.307650Z",
     "iopub.status.busy": "2022-12-16T18:22:58.306156Z",
     "iopub.status.idle": "2022-12-16T18:22:58.334305Z",
     "shell.execute_reply": "2022-12-16T18:22:58.332607Z"
    },
    "papermill": {
     "duration": 0.035276,
     "end_time": "2022-12-16T18:22:58.336713",
     "exception": false,
     "start_time": "2022-12-16T18:22:58.301437",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "'% of women who survived: 74.2038216560509'"
      ],
      "text/latex": [
       "'\\% of women who survived: 74.2038216560509'"
      ],
      "text/markdown": [
       "'% of women who survived: 74.2038216560509'"
      ],
      "text/plain": [
       "[1] \"% of women who survived: 74.2038216560509\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Get the total number of women on the titanic\n",
    "total_women <- sum(train_data$Sex == 'female')\n",
    "# Get the total number of women who survived\n",
    "survived_women <- sum(train_data[which(train_data$Sex == 'female'), \"Survived\"])\n",
    "rate_women = survived_women/total_women\n",
    "\n",
    "paste(\"% of women who survived:\", rate_women * 100)"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 4.259904,
   "end_time": "2022-12-16T18:22:58.462426",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-12-16T18:22:54.202522",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
