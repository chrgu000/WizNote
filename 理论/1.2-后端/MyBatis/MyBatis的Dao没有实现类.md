1：MyBatis的Dao实现类使用mapper的xml配置文件替代了：
    Dao接口全限定名称（包名+接口名）=xml的namespace
    接口方法=xml的<select><update>等的ID

sqlSessionFactoryBulider用于创建sqlSessionFactory，sqlSessionFactory用于创建sqlSession，sqlSession用于CRUD。