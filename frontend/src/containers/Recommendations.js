import React, { useState, useEffect } from 'react';
import { apiBooks, apiCollections, apiContains } from '../services/utilities/API';
import CustomCard from '../components/RecommendCard';
import { Tabs, Divider, Row } from 'antd';
import { useForm, Controller } from 'react-hook-form';
import { connect } from 'react-redux';
import Fade from 'react-reveal/Fade';
import { keyBy } from 'lodash';

function Recommendations(props) {

    const [ratings, setRatings] = useState([]);
    const [rerend, setRerend] = useState(true);
    const [topTen, setTopTen] = useState([]);
    const [random, setRandom] = useState([]);
    const [genre1, setGenre1] = useState([]);
    const [genre2, setGenre2] = useState([]);
    const [genre3, setGenre3] = useState([]);
    const [genre4, setGenre4] = useState([]);
    const [authors, setAuthors] = useState([]);

    useEffect(() => {
        getRandom();
      } , []);  

    const getTopTen = () => {
        apiBooks.getAll()
        .then(res => {
            var sorted = res.data.sort((a, b) => b.read_count - a.read_count);
            setTopTen(sorted.slice(0,10));
        })
    }

    const getByRating = () => {
        apiBooks.getAll()
        .then(res => {
            var filtered = res.data.filter(book => {
                if(book.average_rating > 3.5){
                    return book;
                }else{
                    return null;
                }
            }) 
            setRatings(filtered);
            console.log(random)   
        })
    }

    const getRandom = () =>{
        apiBooks.getAll()
        .then(res => {
            var len = 0;
            var rando;
            var array = [];
            len = res.data.length - 1;
            rando = Math.floor(Math.random() * (len - 0 + 1)) + 0;
            console.log(res.data[rando]);
            array.push(res.data[rando])
            setRandom(array);
        })
       
    }

    const getGenre = () => {
        if(rerend == true){
            apiBooks.getAll()
            .then(res => {
                var sorted = res.data.sort((a, b) => b.read_count - a.read_count);
                sorted.map(gen => {
                    if(gen.genre === 'Childrens'){  
                        setGenre1(prevBooks => [...prevBooks , gen]);
                    }
                    if (gen.genre === 'Fiction'){
                        setGenre2(prevBooks => [...prevBooks , gen]);
                    } 
                    if(gen.genre === 'NonFiction'){
                        setGenre3(prevBooks => [...prevBooks , gen]);
                    }
                    if(gen.genre === 'Crime'){
                        setGenre4(prevBooks => [...prevBooks , gen]);
                    }  
                })
                
            })
        }
        setRerend(false);
    }

    const callback = (key) => {
        console.log(key);
        switch(key){
            case '1':
                getRandom();
                break;
            case '2':
                getGenre();
                break;
            case '3':
                getByRating();
                break;
            case '5':
                getTopTen();
                break;               
        }
    }

    const { TabPane } = Tabs;


    return (
        <div className="site-card-wrapper" style={{ position: 'relative' , bottom: props.partOf ? 60 : -10, left: 30}}>
            <Row gutter={32}>
                <Tabs onChange={callback} type="card" size={"large"} >
                    <TabPane tab="Daily Recommendation" key="1" >
                        <CustomCard partOf={false} booksData={random} />
                    </TabPane>
                    <TabPane tab="Genres" key="2">
                        <div style={{ height: 100, border: '2px solid black', background: `linear-gradient(#283048 , #859398)`}}>
                            <Fade cascade>
                                <h2 style={{
                                        fontFamily:"Book Antiqua,Georgia,Times New Roman,serif",
                                        position: 'relative',
                                        top: 20,
                                        fontSize: 50, 
                                        color: 'white',
                                    }}>Childrens</h2>
                            </Fade>
                        </div>
                            <CustomCard partOf={false} booksData={genre1} />
                        <div style={{ height: 100, border: '2px solid black', background: `linear-gradient(#283048 , #859398)`}}>
                            <Fade cascade>
                                <h2 style={{
                                        fontFamily:"Book Antiqua,Georgia,Times New Roman,serif",
                                        position: 'relative',
                                        top: 20,
                                        fontSize: 50, 
                                        color: 'white',
                                    }}>Fiction</h2>
                            </Fade>
                        </div>
                            <CustomCard partOf={false} booksData={genre2} />
                        <div style={{ height: 100, border: '2px solid black', background: `linear-gradient(#283048 , #859398)`}}>
                            <Fade cascade>
                                <h2 style={{
                                        fontFamily:"Book Antiqua,Georgia,Times New Roman,serif",
                                        position: 'relative',
                                        top: 20,
                                        fontSize: 50, 
                                        color: 'white',
                                    }}>Non-Fiction</h2>
                            </Fade>
                        </div>
                            <CustomCard partOf={false} booksData={genre3} />
                        <div style={{ height: 100, border: '2px solid black', background: `linear-gradient(#283048 , #859398)`}}>
                            <Fade cascade>
                                <h2 style={{
                                        fontFamily:"Book Antiqua,Georgia,Times New Roman,serif",
                                        position: 'relative',
                                        top: 20,
                                        fontSize: 50, 
                                        color: 'white',
                                    }}>Crime</h2>
                            </Fade>
                        </div>
                            <CustomCard partOf={false} booksData={genre4} />
                    </TabPane>
                    <TabPane tab="Average Rating" key="3">
                        <CustomCard partOf={false} booksData={ratings} />
                    </TabPane>
                    <TabPane tab="Top 10 By Read Count" key="5">
                    <CustomCard partOf={false} booksData={topTen} />
                    </TabPane>
                </Tabs>
            </Row>
        </div>
    )
}

const mapStateToProps = state => {
    return {
        user_id: state.user_id,
    }
}

export default connect(mapStateToProps)(Recommendations);