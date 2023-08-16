import { useState } from "react";

const Accordion = () => {
    const [hide1, setHide1] = useState(true)
    const [hide2, setHide2] = useState(true)
    const [hide3, setHide3] = useState(true)
    return(
            <>
            <div>
            First Title <button onClick={()=>{setHide1(!hide1)}}>{ hide1? "More" : "Less"}</button>
            {!hide1 && <p>This is the first detail</p>}
            </div>
            <div>
            Second Title <button onClick={()=>{setHide2(!hide2)}}>{ hide2? "More" : "Less"}</button>
            {!hide2 && <p>This is the second detail</p>}
            </div>
            <div>
            Third Title <button onClick={()=>{setHide3(!hide3)}}>{ hide3? "More" : "Less"}</button>
            {!hide3 && <p>This is the Third detail</p>}
            </div>
            </>
    )
}

export default Accordion;