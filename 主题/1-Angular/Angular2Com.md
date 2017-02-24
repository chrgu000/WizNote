+ InMemoryWebApiModule将Http客户端默认的后端服务 — 这是一个辅助服务，负责与远程服务器对话 — 替换成了内存 Web API服务
	```
	InMemoryWebApiModule.forRoot(InMemoryDataService)
	
	import { InMemoryDbService } from 'angular-in-memory-web-api';
	export class InMemoryDataService implements InMemoryDbService {
	  createDb() {
		let heroes = [
		  {id: 11, name: 'Mr. Nice'},
		  {id: 12, name: 'Narco'},
		  {id: 13, name: 'Bombasto'},
		  {id: 14, name: 'Celeritas'},
		  {id: 15, name: 'Magneta'},
		  {id: 16, name: 'RubberMan'},
		  {id: 17, name: 'Dynama'},
		  {id: 18, name: 'Dr IQ'},
		  {id: 19, name: 'Magma'},
		  {id: 20, name: 'Tornado'}
		];
		return {heroes};
	  }
	}

	//Angular 的Observable并没有一个toPromise操作符... 没有打包在一起发布。 Angular的Observable只是一个骨架实现。
	  private heroesUrl = 'app/heroes';  // URL to web api
	  constructor(private http: Http) { }
	  getHeroes(): Promise<Hero[]> {
		return this.http.get(this.heroesUrl)
				   .toPromise()//利用toPromise操作符把Observable直接转换成Promise对象
				   .then(response => response.json().data as Hero[])
				   .catch(this.handleError);
	  }

	  private handleError(error: any): Promise<any> {
		  console.error('An error occurred', error); // for demo purposes only
		  return Promise.reject(error.message || error);
		}

		
	private headers = new Headers({'Content-Type': 'application/json'});
	update(hero: Hero): Promise<Hero> {
	  const url = `${this.heroesUrl}/${hero.id}`;
	  return this.http
	  //put 的 body 是该英雄的 JSON 字符串，它是通过调用JSON.stringify得到的。 并且在请求头中标记出的 body 的内容类型（application/json）。
		.put(url, JSON.stringify(hero), {headers: this.headers})
		.toPromise()
		.then(() => hero)
		.catch(this.handleError);
	}

	
	add(name: string): void {
	  name = name.trim();
	  if (!name) { return; }
	  this.heroService.create(name)
		.then(hero => {
		  this.heroes.push(hero);
		  this.selectedHero = null;
		});
	}

	create(name: string): Promise<Hero> {
	  return this.http
		.post(this.heroesUrl, JSON.stringify({name: name}), {headers: this.headers})
		.toPromise()
		.then(res => res.json().data)
		.catch(this.handleError);
	}

	delete(hero: Hero): void {
	  this.heroService
		  .delete(hero.id)
		  .then(() => {
			this.heroes = this.heroes.filter(h => h !== hero);
			if (this.selectedHero === hero) { this.selectedHero = null; }
		  });
	}
	delete(id: number): Promise<void> {
	  const url = `${this.heroesUrl}/${id}`;
	  return this.http.delete(url, {headers: this.headers})
		.toPromise()
		.then(() => null)
		.catch(this.handleError);
	}

	```
+ 一个可观察对象是一个事件流，我们可以用数组型操作符来处理它,Angular 内核中提供了对可观察对象的基本支持。而我们这些开发人员可以自己从 RxJS 可观察对象库中引入操作符和扩展。 我们会简短的讲解下如何做
我们可以开始一个请求， 并且取消它，在服务器对第一个请求作出回应之前，再开始另一个不同的请求 。 像这样一个请求-取消-新请求的序列用承诺是很难实现的，但接下来我们会看到，它对于可观察对象却很简单。

+ NgModule组成:
	+ declarations视图类 - 声明本模块中拥有的视图类。 Angular 有三种视图类：组件、指令和管道。
	+ exports模板 - declarations 的子集，可用于其它模块的组件模板。
	+ imports模块 - 本模块声明的组件模板需要的类所在的其它模块。
	+ providers服务 - 服务的创建者，并加入到全局服务列表中，可用于应用任何部分。
	+ bootstrap主视图 - 指定应用的主视图（称为根组件），它是所有其它视图的宿主。只有根模块才能设置bootstrap属性。
+ NgModule和Js模块
	+ JavaScript 中，每个文件是一个模块，文件中定义的所有对象都从属于那个模块。 通过export关键字，模块可以把它的某些对象声明为公共的。 其它 JavaScript 模块可以使用import 语句来访问这些公共对象。
	